class Event < ApplicationRecord
  
  belongs_to :user
  
  validates :income, :expense, allow_blank: true, numericality: {only_integer: true}, length: { in: 0..8 }

end
