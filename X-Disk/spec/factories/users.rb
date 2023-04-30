FactoryBot.define do
  factory :user do
    login { "abobka" }
    password { "Abc123!@#" }
    password_confirmation { "Abc123!@#" }
  end
end
