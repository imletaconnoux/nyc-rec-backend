class UserSerializer < ActiveModel::Serializer
  attributes *User.column_names
  has_many :user_prefs
end
