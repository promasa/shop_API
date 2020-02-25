class PrivateItemChatsController < ApplicationController
  before_action :authorize!
  before_action :set_purchase
  before_action :set_item
  before_action :check_auth_user
  
  def create
    chat = PrivateItemChat.new(private_item_chat_params)
    chat.item = @item
    chat.user = current_user
    chat.save
    serializer = ItemChatSerializer.new(chat)
    render json: serializer.as_json
  end

  def index
    texts = @item.private_item_chats
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

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def check_auth_user
    if current_user.id != @purchase.user_id && current_user.id != @purchase.item.user_id
    raise ActionController::BadRequest and return
    end
  end

end
