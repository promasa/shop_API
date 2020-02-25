class PrivateItemChat < ApplicationRecord
  validates :text, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  validates :item_id, presence: true
  belongs_to :item
  belongs_to :user
end
