class Item < ApplicationRecord
  validates :name, presence:true, length: {maximum: 30}
  validates :description, presence:true, length: {maximum: 100}
  validates :price, presence:true, numericality: {greater_than_or_equal_to: 100}
  validates :user_id, presence:true
  
  belongs_to :user
  has_one :purchase
  has_many :item_chats
  has_many :private_item_chats
  has_many :favorites
  has_many :favo_user, through: :favorites, source: :user
  has_one :evaluation
end
