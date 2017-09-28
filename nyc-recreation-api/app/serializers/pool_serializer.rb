class PoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :phone, :pools_outdoor_type, :setting, :size
end
