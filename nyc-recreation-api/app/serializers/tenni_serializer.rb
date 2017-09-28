class TenniSerializer < ActiveModel::Serializer
  attributes *Tenni.column_names
end
