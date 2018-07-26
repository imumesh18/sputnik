class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_password
  after_save :clear_password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,30}\z/
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true, :format => PASSWORD_REGEX 

  def self.authenticate(login_email="", login_password="")
    user = User.find_by_email(login_email)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end