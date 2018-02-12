class Todo < ApplicationRecord
  validates :do_date, presence: true
  validates :title, presence: true, length: { maximum: 30 }
end
