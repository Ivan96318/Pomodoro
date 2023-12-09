class PasswordRecovery
  include ActiveModel::Model

  # this is for the second step for recovery the password
  # this is necessary to check the password and password confirmation is the same
  attr_accessor :password, :password_confirmation

  validates :password, :password_confirmation, presence: true
end
