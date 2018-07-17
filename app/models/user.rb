class User < ApplicationRecord

  attr_accessor :create_remember_token
  before_create :create_remember_token
  has_secure_password
  has_many :posts

  private

  def create_remember_token

  self.remember_token =  Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end

end
