class User < ApplicationRecord
  validates :name ,presence:true
  validates :email ,presence:true
  has_secure_password
  has_secure_token

  has_many :item, dependent: :destroy
  has_many :favorites
  has_many :fav_item, through: :favorites, source: :item

  has_many :active_relationships, class_name:"Relationship", foreign_key:"follower_id",dependent: :destroy 
  has_many :passive_relationships, class_name:"Relationship", foreign_key:"followed_id",dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  # has_many :from_id, class_name: "PrivateChat",foreign_key: "from_id", dependent: :destroy
  # has_many :to_id, class_name: "PrivateChat",foreign_key: "to_id", dependent: :destroy
  # has_many :sent_messages, through: :from_id, source: :from
  #followed has_many :received_messages, through: :to_id, source: :to
end