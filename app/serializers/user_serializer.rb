class UserSerializer
  include JSONAPI::Serializer

  attributes :user_name,
             :email,
             :street_address,
             :city,
             :state,
             :zipcode,
             :activity_preferences,
             :latitude,
             :longitude,
             :oauth
end
