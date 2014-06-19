FactoryGirl.define do
  factory :user, class: Wigglez::Database::SQL::User, :aliases => [:donor, :receiver] do
    name "Katrina"
    sequence(:email) {|n| "email#{n}@factory.com" }
  end
  factory :wig, class: Wigglez::Database::SQL::Wig do
    donor
    material 'synthetic'
    color 'brown'
    length 'long'
    gender 'female'
    retail_estimate 400
    condition 'new'
    construction 'custom'
    size 'average'
  end
  factory :wig2, class: Wigglez::Database::SQL::Wig do
    donor
    material 'synthetic'
    color 'blonde'
    length 'short'
    gender 'female'
    retail_estimate 300
    condition 'new'
    construction 'custom'
    size 'average'
  end
end
