class BbqSerializer < ActiveModel::Serializer
  attributes *Bbq.column_names
end
