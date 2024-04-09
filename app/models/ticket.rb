class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_to, class_name: "User", foreign_key: "assigned_to_id"

  enum status: { pending: 0, in_progress: 1, done: 2, cancel: 3, pause: 4 }

  validates :short_description, :status, presence: true
end
