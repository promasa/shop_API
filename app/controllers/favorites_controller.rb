class FavoritesController < ApplicationController
  before_action: authorize!
  before_action: set_user
  before_action: set_item, only:[:create, :destroy]
  before_action: 
  def create
    @user.favorites.find_or_create_by(item_id: @item.id)
    render json: {'message': 'お気に入りしました'}
  end

  def destroy
    favo = @user.favorites.find_by(item_id: @item.id)
    favo.destroy!
    render json: {'message': 'お気に入りが削除されました'}
  end

  def index
    favo = @user.fav_item
    serializer = ActiveModel::Serializer::CollectionSerializer.new(favo,serializer:FavoriteListSerializer)
    render json: serializer.as_json
  end

  def set_user
    @user = User.find_by(id: current_user.id)
  end
  def set_item
    @item = Item.find_by(id: params[:id])
  end
end
