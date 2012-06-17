# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workout do
    cycle_id 1
    title "MyString"
    completed false
    completed_date "2012-06-16 12:09:58"
  end
end
