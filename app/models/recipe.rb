class Recipe < ApplicationRecord
   # cocoonで子フォームを親と一緒に保存するための記述。accepts_nested_attributes_forというメソッドを使っています。
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  has_many :recipe_materials, dependent: :destroy
  accepts_nested_attributes_for :recipe_materials, allow_destroy: true
  has_many :materials, through: :recipe_materials
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  validates :title, presence: true
  validates :body, length: { maximum: 20 }
  
  has_one_attached :image
  
  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }
  
end
