class User < ApplicationRecord
  has_many :custom_rec_areas
  has_many :user_adventures
  has_many :adventures, through: :user_adventures

  enum access: { user: 0, admin: 1}

  validates :user_name,
            :presence => {message: "can't be blank"},
            :uniqueness => true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            :presence => {message: "can't be blank"},
            :uniqueness => true
  validates :password_digest,
            :presence => {message: "can't be blank"}
  validates :access,
            :presence => {message: "can't be blank"}
  validates :street_address,
            :presence => {message: "can't be blank"}
  validates :city,
            :presence => {message: "can't be blank"}
  validates :state,
            :presence => {message: "can't be blank"}
  validates :zipcode,
            :presence => {message: "can't be blank"}
  validates :activity_preferences,
            :presence => {message: "can't be blank"}

  has_secure_password

  # after_commit :add_coordinates, on: [:create, :update]

  def add_coordinates
    address = [street_address, city, state].compact.join(', ')
    cords = Geocoder.search(address).first.data
    self.latitude = cords["lat"]
    self.longitude = cords["lon"]
  end
end
