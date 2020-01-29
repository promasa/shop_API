class PrivateItemChatsController < ApplicationController
  before_action :authorize!
  before_action :set_purchase
  before_action :check_auth_user
  
  def create
    text = PrivateItemChat.new(private_item_chat_params)
    text.item_id = params[:item_id]
    text.user_id = current_user.id
    text.save
    serializer = ItemChatSerializer.new(text)
    render json: serializer.as_json
  end

  def index
    texts = PrivateItemChat.where(item_id: params[:item_id])
    serializer = ActiveModel::Serializer::CollectionSerializer.new(texts,serializer:ItemChatSerializer)
    render json: serializer.as_json
  end

  def private_item_chat_params
    params.require(:private_item_chat_params).permit(
      :text
    )
  end
  def set_purchase
    @purchase = Purchase.find_by(item_id:params[:item_id])
  end
  def check_auth_user
    if current_user.id != @purchase.user_id && current_user.id != @purchase.item.user_id
    raise ActionController::BadRequest and return
    end
  end
end
