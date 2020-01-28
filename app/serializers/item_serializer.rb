class ItemSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :description,
  :price,
  :user_id,
  :status,
  :created_at,
  :updated_at,
  :user

  def user
    user = User.where(id: object.user_id).first
    UserSerializer.new(user)
  end
end