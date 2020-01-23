class UserSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :bio,
  :created_at,
  :updated_at
end
