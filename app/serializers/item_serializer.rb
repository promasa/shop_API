class ItemSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :description,
  :price,
  :status,
  :created_at,
  :updated_at,
  :user

  def user
    UserSerializer.new(object.user)
  end
end