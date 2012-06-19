# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mesocycle do
    user_id 1
    program_id 1
    max_bench 1
    max_squat 1
    max_deadlift 1
    max_ohp 1
  end
end
