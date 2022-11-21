class User < ApplicationRecord

  has_many :post, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  has_many :comment, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
