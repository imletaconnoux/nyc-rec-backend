class TenniSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :phone, :courts, :indoor_outdoor, :tennis_type, :info
end
