class ItemsController < ApplicationController
  before_action :authorize!
  def index
    query = Item.all
    query = query.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
    if params[:query].present?
      query =query.where("name Like?" ,"%#{params[:query]}%")
    end
    serializer = ActiveModel::Serializer::CollectionSerializer.new(query,serializer:ItemSerializer)
    render json: serializer.as_json
  end

  def create
    item = Item.new(item_params)
    item.user_id = current_user.id
    item.save
    serializer = ItemSerializer.new(item)
    render json: serializer.as_json
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    serializer = ItemSerializer.new(item)
    render json: serializer.as_json
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy!
    render json: {'message': '正常にUser削除されました'}
  end

  def show
    item = Item.find(params[:id])
    serializer = ItemSerializer.new(item)
    render json: serializer.as_json
  end

  def item_params
    params.require(:item_params).permit(
      :name,
      :description,
      :price
    )
  end
end
