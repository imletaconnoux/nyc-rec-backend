class PoolSerializer < ActiveModel::Serializer
  attributes *Pool.column_names
end
