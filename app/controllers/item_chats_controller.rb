class ItemChatsController < ApplicationController
  before_action :authorize!
  before_action :set_item, only:[:create, :index]
  before_action :set_text, only:[:show, :update, :destroy]
  before_action :check_auth_update, only:[:update, :destroy]

  def create
    chat = ItemChat.new(item_chat_params)
    chat.item = @item
    chat.user = current_user
    chat.save
    serializer = ItemChatSerializer.new(chat)
    render json: serializer.as_json
  end

  def update
    @text.update!(item_chat_params)
    serializer = ItemChatSerializer.new(@text)
    render json: serializer.as_json
  end

  def destroy
    @text.destroy!
    render json: {'message': '正常にUser削除されました'}
  end

  def show
    serializer = ItemChatSerializer.new(@text)
    render json: serializer.as_json
  end

  def index
    texts = @item.item_chats
    serializer = ActiveModel::Serializer::CollectionSerializer.new(texts,serializer:ItemChatSerializer)
    render json: serializer.as_json
  end

  def item_chat_params
    params.require(:item_chat_params).permit(
      :text
    )
  end

  def set_text
    @text = ItemChat.find_by(id: params[:id])
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def check_auth_update
    if @text.user_id != current_user.id 
        raise ActionController::BadRequest and return
    end
  end

end
