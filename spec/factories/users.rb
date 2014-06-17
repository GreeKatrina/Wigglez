require 'spec_helper'

FactoryGirl.define do
    # Define a basic devise user.
    factory :user, :class => User do
        email "example@example.com"
        password "example"
        password_confirmation "example"
    end
end
