class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  has_many :favorites, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
         
  validates :name, :email, :password, :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, :password_confirmation, length: { minimum: 6 }
  validates :password, confirmation: true
  
  has_one_attached :image
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
  # selfにはカレントユーザーが入り、カレントユーザーに結びついている言い値の中で、
  # 今いいねしようとしているレシピのIDが存在するか(exists)を調べている
  # もうすでにレシピIDに言い値が保存されていたなら、をここで定義している
  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end
end
