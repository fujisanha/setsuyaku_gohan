class Recipe < ApplicationRecord
   # cocoonで子フォームを親と一緒に保存するための記述。accepts_nested_attributes_forというメソッドを使っています。
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  has_many :recipe_materials, dependent: :destroy
  accepts_nested_attributes_for :recipe_materials, allow_destroy: true
  
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, length: { maximum: 100 }
  
  has_one_attached :image
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
