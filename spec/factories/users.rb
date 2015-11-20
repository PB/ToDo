FactoryGirl.define do
  factory :user do
    email 'test@test.pl'
    password 'password'
    password_confirmation { 'password' }
  end
end
