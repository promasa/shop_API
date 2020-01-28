class ItemChatSerializer < ActiveModel::Serializer
  attributes :id,
  :item_id,
  :user_id,
  :text,
  :created_at,
  :updated_at,
  :user

  def user
    user = User.where(id: object.user_id).first
    UserSerializer.new(user)
  end
end

