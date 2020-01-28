class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one :item_chat
end
