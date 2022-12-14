class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_name, presence: true, length:{minimum:2, maximum:20}
  validates :email, presence: true, length:{minimum:2, maximum:50}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
