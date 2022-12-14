class Bookmark < ApplicationRecord

  belongs_to :user
  belongs_to :post

  #一意(ユニーク)であることのバリデーション
  validates_uniqueness_of :post_id, scope: :user_id

end
