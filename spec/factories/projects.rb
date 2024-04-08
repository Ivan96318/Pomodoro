# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { 'Almanaque' }
    description { 'Project to travel in the time' }
    project_type { 1 }
    user
  end
end
