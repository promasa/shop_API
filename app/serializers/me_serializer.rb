class MeSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :token,
  :bio,
  :created_at,
  :updated_at
end
