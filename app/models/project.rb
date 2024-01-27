class Project < ApplicationRecord
  enum project_type: { personal: 0, work: 1 }

  validates :name, :description, :project_type, presence: true
end
