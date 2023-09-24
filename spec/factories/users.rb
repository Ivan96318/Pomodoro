FactoryBot.define do
  factory :user do
    name { "Juan" } # TODO: Change for somethig random
    email { "juan@email.com" } # TODO: Change for the random name and still @email.com
    password { "123456-Ab" }
  end
end
