class PurchaseSerializer < ActiveModel::Serializer
  attributes :id,
  :item_id,
  :user_id
  

  # def a
  #   owner = Item.where(id: object.item).first
  #   user = User.where(id: object.owner.user_id).first
  #   UserSerializer.new(user)
  # end
end
