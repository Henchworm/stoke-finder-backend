class AdventureSerializer
  include JSONAPI::Serializer
  set_type :adventure
  set_type :id
  attributes :guest_email_addresses,
             :date,
             :comment,
             :activities,
             :favorite,
             :rec_area_id
end