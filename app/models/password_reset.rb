class PasswordReset
  include ActiveModel::Model

  # This is the first step to recovery the password
  # The user must first enter his email to send it a email to recovery his password
  attr_accessor :email
end
