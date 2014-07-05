require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe Wigglez::PostWig do
  before(:each) do
    @db = Wigglez.db
    @PostWig = Wigglez::PostWig.new
    @User = FactoryGirl.create(:user)
    @Wig = {
      material: 'synthetic',
      color: 'medium brown',
      length: 'long',
      gender: 'female',
      retail_estimate: 400,
      condition: 'new',
      construction: 'monofilament',
      size: 'average'
    }
  end

  describe 'params' do
    it 'does not throw an error if an optional param is not set' do
      @Wig.delete(:retail_estimate)
      @Wig.delete(:construction)
      @Wig.delete(:size)
      result = @PostWig.run(@Wig, @User.id)
      expect(result.success?).to eq true
      expect(result.wig.retail_estimate).to eq nil
      expect(result.wig.construction).to eq nil
      expect(result.wig.size).to eq nil
    end

    it 'should have all of the required params' do
      result = @PostWig.run(@Wig, @User.id)
      expect(result.success?).to eq true
      expect(result.wig.donor_id).to eq @User.id
      expect(result.wig.material).to eq 'synthetic'
      expect(result.wig.color).to eq 'medium brown'
      expect(result.wig.length).to eq 'long'
      expect(result.wig.gender).to eq 'female'
      expect(result.wig.condition).to eq 'new'
      expect(result.wig.construction).to eq 'monofilament'
      expect(result.wig.size).to eq 'average'
    end

    it 'should throw an error if a required field is empty' do
      @Wig[:color] = ""
      @Wig[:material] = ""
      result = @PostWig.run(@Wig, @User.id)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :color => ["can't be blank", "is not included in the list"], :material => ["can't be blank", "is not included in the list"]
    end

    it 'should throw an error if the donor is not registered' do
      result = @PostWig.run(@Wig, 0)
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_params
      expect(result.reasons).to eq :donor_id => ["The donor is not registered."]
    end
  end

  after :each do
    @db.CLEAR_ALL
  end
end
