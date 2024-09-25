# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  enum project_type: { personal: 0, work: 1 }

  validates :name, :description, :project_type, presence: true
end
