class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one :item_chat
  has_one :private_item_chat
  has_many :favorite
  has_many :user, through: :favorite
end
