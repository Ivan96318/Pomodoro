FactoryBot.define do
  factory :ticket do
    short_description { "Ticket 1" }
    long_description { "Lorem ipsum" }
    status { 0 }
    due_date { 1.day.from_now }
    project { create(:project) }
    assigned_to { create(:user) }
  end
end
