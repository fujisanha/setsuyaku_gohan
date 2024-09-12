class Recipe < ApplicationRecord
   # cocoonで子フォームを親と一緒に保存するための記述。accepts_nested_attributes_forというメソッドを使っています。
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  
  has_one_attached :image
end
