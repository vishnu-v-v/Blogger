class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, counter_cache: true
end
