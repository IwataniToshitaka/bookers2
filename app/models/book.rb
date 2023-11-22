class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  #空欄はダメ、かつ、bodyは２００文字以内
  validates :title, presence: true, uniqueness: true
  #バリデーションを使用して、一意性を条件に追加。同じタイトルの本は登録できないようにした

end