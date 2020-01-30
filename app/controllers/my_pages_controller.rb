class MyPagesController < ApplicationController
  before_action :authorize!
  def my_item
    item = Item.where(user_id: current_user.id).order(updated_at: :desc)
    serializer = ActiveModel::Serializer::CollectionSerializer.new(item,serializer:ItemSerializer)
    render json: serializer.as_json
  end

  def bought
    purchase= Purchase.where(user_id: current_user.id).order(updated_at: :desc)
    serializer = ActiveModel::Serializer::CollectionSerializer.new(purchase,serializer:PurchaseSerializer)
    render json: serializer.as_json
  end

  
end
