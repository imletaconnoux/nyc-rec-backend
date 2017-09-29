class Tenni < ApplicationRecord
  has_many :user_prefs
  has_many :users, through: :user_prefs
end
