class UserSerializer
  include JSONAPI::Serializer
  set_type :user
  set_type :id
  attributes :user_name,
             :email,
             :street_address,
             :city,
             :state,
             :zipcode,
             :activity_preferences,
             :latitude,
             :longitude
end