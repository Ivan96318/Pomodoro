class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_to, class_name: "User", foreign_key: "assigned_to_id", optional: true

  enum status: { to_do: 0, in_progress: 1, done: 2, cancel: 3, pause: 4, pending: 5 }

  validates :short_description, presence: true
end
