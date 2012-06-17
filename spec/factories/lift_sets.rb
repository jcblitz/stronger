# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lift_set do
    workout_id 1
    exercise "MyString"
    reps "MyString"
    weight 1
  end
end
