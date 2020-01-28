class PrivateChatSerializer < ActiveModel::Serializer
  attributes :id,
  :text,
  :from_id,
  :to_id,
  :room_id,
  :created_at,
  :updated_at,
  :from_user,
  :to_user

  def from_user
    user = User.where(id: object.from_id).first
    UserSerializer.new(user)
  end
  def to_user
    user = User.where(id: object.to_id).first
    UserSerializer.new(user)
  end
end
