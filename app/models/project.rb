# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user

  enum project_type: { personal: 0, work: 1 }

  validates :name, :description, :project_type, presence: true
end
