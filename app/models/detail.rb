class Detail < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
end
