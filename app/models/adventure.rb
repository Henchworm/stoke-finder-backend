class Adventure < ApplicationRecord
  belongs_to :CustomRecAreas
  validates_presence_of :guest_email_addresses,
                        :date,
                        :comment,
                        :activities,
                        :favorite,
                        :rec_area_id

  has_many :user_adventures
  has_many :users, through: :user_adventures
end
