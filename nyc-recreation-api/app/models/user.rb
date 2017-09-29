class User < ApplicationRecord
  has_secure_password
  has_many :user_prefs
  has_many :bbqs, through: :user_prefs
  has_many :zoos, through: :user_prefs
  has_many :pools, through: :user_prefs
  has_many :tennis, through: :user_prefs
end
