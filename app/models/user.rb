class User < ApplicationRecord
  has_secure_password
  PASSWORD_REQUERIMENTS = /\A
  (?=.{8,}) # At least 8 characters
  (?=.*\d) # Contain at least one number
  (?=.*[a-z]) # Contain at least one lowercase letter
  (?=.*[A-Z]) # Contain at least one uppercase letter
  (?=.*[[:^alnum:]]) # Contain at least one symbol
  /x

  # TODO: setup email_validator well
  validates :email, :name, presence: true
  validates :email, email: true
  validates :password,  format: PASSWORD_REQUERIMENTS

  validates_uniqueness_of :email
end
