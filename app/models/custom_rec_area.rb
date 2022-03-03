class CustomRecArea < ApplicationRecord
  belongs_to :user

  validates :name,
            :presence => {message: "can't be blank"}
  validates :longitude,
            :presence => {message: "can't be blank"},
            :numericality => { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :latitude,
            :presence => {message: "can't be blank"},
            :numericality => { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :activities,
            :presence => {message: "can't be blank"}
  validates :comments,
            :presence => {message: "can't be blank"}
end
