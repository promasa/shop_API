class User < ApplicationRecord
  validates :name ,presence:true
  validates :email ,presence:true
  has_secure_password
  has_secure_token

  has_many :item , dependent: :destroy
  has_many :from_id, class_name: "PrivateChat",foreign_key: "from_id", dependent: :destroy
  has_many :to_id, class_name: "PrivateChat",foreign_key: "to_id", dependent: :destroy
  has_many :sent_messages, through: :from_id, source: :from
has_many :received_messages, through: :to_id, source: :to
end
