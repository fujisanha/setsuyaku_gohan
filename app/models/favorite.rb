class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :recipe
  
  # 一つのrecipeに対して一つのいいねしか付けられない設定
  validates_uniqueness_of :recipe_id, scope: :user_id
  
end
