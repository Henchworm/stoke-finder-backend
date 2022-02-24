class Adventure < ApplicationRecord
  belongs_to :CustomRecAreas
  validates_presence_of :guest_email_address,
                        :date,
                        :comment,
                        :activity,
                        :favorite 
  validates_presence_of :rec_area_id, allow_nil: true
  validates_presence_of :custom_rec_areas_id, allow_nil: true

  has_many :user_adventures
  has_many :users, through: :user_adventures
end
