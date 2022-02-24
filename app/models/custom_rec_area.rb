class CustomRecArea < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, 
                        :longitude,
                        :latitude,
                        :activities,
                        :comments
end
