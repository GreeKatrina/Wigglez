require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::PostWig do
  before(:each) do
    @db = Wigglez.db
    @PostWig = Wigglez::PostWig.new
    @User = FactoryGirl.create(:user)
    @Wig = {
      donor_id: @User.id,
      material: 'synthetic',
      color: 'brown',
      length: 'long',
      gender: 'female',
      retail_estimate: 400,
      condition: 'new',
      construction: 'custom',
      size: 'average'
    }
  end

  describe 'params' do
    it "should have the not required params set to nil" do
      result = @PostWig.run(@Wig)
      expect(result.success?).to eq true
      expect(result.wig.tracking_number).to eq nil
      expect(result.wig.receiver).to eq nil
      expect(result.wig.date_picked).to eq nil
      expect(result.wig.received).to eq nil
    end

    it 'does not throw an error if an optional param is not set' do
      @Wig.delete(:retail_estimate)
      @Wig.delete(:construction)
      @Wig.delete(:size)
      result = @PostWig.run(@Wig)
      expect(result.success?).to eq true
      expect(result.wig.retail_estimate).to eq nil
      expect(result.wig.construction).to eq nil
      expect(result.wig.size).to eq nil
    end

    it 'should have all of the required params' do
      result = @PostWig.run(@Wig)
      expect(result.success?).to eq true
      expect(result.wig.donor).to eq @User.id
      expect(result.wig.material).to eq 'synthetic'
      expect(result.wig.color).to eq 'brown'
      expect(result.wig.length).to eq 'long'
      expect(result.wig.gender).to eq 'female'
      expect(result.wig.condition).to eq 'new'
      expect(result.wig.construction).to eq 'custom'
      expect(result.wig.size).to eq 'average'
    end

    it 'should throw an error if a required field is empty' do
      @Wig[:color] = ""
      @Wig[:material] = ""
      result = @PostWig.run(@Wig)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :color => ["can't be blank"], :material => ["can't be blank"]
    end
  end

  after :each do
    @db.CLEAR_ALL
  end
end
