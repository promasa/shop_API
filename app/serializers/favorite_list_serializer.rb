class FavoriteListSerializer < ActiveModel::Serializer
  attributes :id,
  :item_id,
  :item
  
  def item
    item = Item.find_by(id: object.item_id)
    ItemSerializer.new(item)
  end
end
