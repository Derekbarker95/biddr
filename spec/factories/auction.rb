FactoryGirl.define do

  factory :auction do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}"}
    description Faker::Lorem.paragraph
    reserve 1000
    end_date "2019-11-11 10:33:20"
    currentprice 10
  end

end