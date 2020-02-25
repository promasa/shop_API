class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}, uniqueness: true
  validates :email, presence: true, length: {maximum: 30}

  has_secure_password
  has_secure_token

  has_many :items
  has_many :item_chats
  has_many :private_item_chat
  has_many :purchases

  has_many :favorites
  has_many :favo_items, through: :favorites, source: :item

  has_many :active_relationships, class_name:"Relationship", foreign_key:"follower_id",dependent: :destroy 
  has_many :passive_relationships, class_name:"Relationship", foreign_key:"followed_id",dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :evaluated, class_name:"Evaluation",foreign_key:"evaluated_id", dependent: :destroy
  has_many :evaluator, class_name:"Evaluation",foreign_key:"evaluator_id", dependent: :destroy
end