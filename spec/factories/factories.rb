FactoryGirl.define do
  factory :user, class: Wigglez::Database::SQL::User, :aliases => [:donor] do
    name "Katrina"
    sequence(:email) {|n| "email#{n}@factory.com" }
  end
  factory :wig, class: Wigglez::Database::SQL::Wig do
    donor
    material 'synthetic'
    color 'medium brown'
    length 'long'
    gender 'female'
    retail_estimate 400
    condition 'new'
    construction 'monofilament'
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
    construction 'monofilament'
    size 'average'
  end
  factory :user2, class: Wigglez::Database::SQL::User, :aliases => [:receiver] do
    name "Miranda"
    sequence(:email) {|n| "email1#{n}@factory.com"}
  end
end
