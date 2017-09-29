class UserPref < ApplicationRecord
  belongs_to :user
  has_one :bbq
  has_one :zoo
  has_one :pool
  has_one :bbq
  has_one :tenni
end
