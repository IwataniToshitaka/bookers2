class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  #空欄はダメ、かつ、bodyは２００文字以内

end