class ZooSerializer < ActiveModel::Serializer
  attributes *Zoo.column_names
end
