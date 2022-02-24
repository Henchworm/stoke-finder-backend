class User < ApplicationRecord
  enum access: { user: 0, admin: 1}

  validates_presence_of :user_name, uniqueness: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password_digest, require: true
  validates_presence_of :access, require: true
  validates_presence_of :street_address, require: true
  validates_presence_of :city, require: true
  validates_presence_of :state, require: true
  validates_presence_of :zipcode, require: true
  validates_presence_of :activity_preferences, require: true

  has_secure_password

  has_many :custom_rec_areas
  has_many :user_adventures
  has_many :adventures, through: :user_adventures
end
