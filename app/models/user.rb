class User < ApplicationRecord
  before_create :generate_new_auth_token
  # acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :authentication_token, uniqueness: true

  def generate_new_auth_token
    loop do
      self.authentication_token = Devise.friendly_token
      break unless self.class.exists?(authentication_token: authentication_token)
    end
  end

  # def generate_new_auth_token
  #   token = User.generate_unique_secure_token

  #   # update_attributes authentication_token: token
  #   update authentication_token: token
  # end
end
