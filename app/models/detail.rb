class Detail < ApplicationRecord
  belongs_to :recipe
  has_one_attached :image
  
  validates :body, presence: true
end
