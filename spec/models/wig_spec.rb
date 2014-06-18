require 'spec_helper'
require 'rails_helper'
require 'pry-byebug'

describe "Wig" do
  before(:each) do
    @db = Wigglez::Database::SQL.new
    @Wig = Wigglez::Database::SQL::Wig
  end

  # Add specs for Wig class if needed.

  after(:each) do
    @db.CLEAR_ALL
  end
end
