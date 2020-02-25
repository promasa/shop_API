class MyPagesController < ApplicationController
  before_action :authorize!
  
  def my_item
    item = current_user.items
    serializer = ActiveModel::Serializer::CollectionSerializer.new(item,serializer:ItemSerializer)
    render json: serializer.as_json
  end

  def bought
    purchase= current_user.purchases
    serializer = ActiveModel::Serializer::CollectionSerializer.new(purchase,serializer:PurchaseSerializer)
    render json: serializer.as_json
  end

  def followings
    relationships = current_user.followings
    serializer = ActiveModel::Serializer::CollectionSerializer.new(relationships,serializer:UserSerializer)
    render json: serializer.as_json
  end

  def followers
    relationships = current_user.followers
    serializer = ActiveModel::Serializer::CollectionSerializer.new(relationships,serializer:UserSerializer)
    render json: serializer.as_json
  end

  def favorites
    favo = current_user.favo_items
    serializer = ActiveModel::Serializer::CollectionSerializer.new(favo,serializer:FavoriteListSerializer)
    render json: serializer.as_json
  end
end
