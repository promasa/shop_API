class ItemsController < ApplicationController
  before_action :authorize!
  before_action :set_item, only:[:update, :destroy, :show]
  before_action :check_auth_update, only:[:destroy, :update]
  
  def index
    query = Item.all.includes(user: :items)
    query = query.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
    if params[:query].present?
      query =query.where("name Like?" ,"%#{params[:query]}%")
    end
    serializer = ActiveModel::Serializer::CollectionSerializer.new(query,serializer:ItemSerializer)
    render json: serializer.as_json
  end

  def create
    item = Item.new(item_params)
    item.user = current_user
    item.save
    serializer = ItemSerializer.new(item)
    render json: serializer.as_json
  end

  def update
    @item.update!(item_params)
    serializer = ItemSerializer.new(@item)
    render json: serializer.as_json
  end

  def destroy
    @item.destroy!
    render json: {'message': '正常にUser削除されました'}
  end

  def show
    serializer = ItemSerializer.new(@item)
    render json: serializer.as_json
  end

  def item_params
    params.require(:item_params).permit(
      :name,
      :description,
      :price
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_auth_update
    if @item.user_id != current_user.id 
        raise ActionController::BadRequest and return
    end
  end
end
