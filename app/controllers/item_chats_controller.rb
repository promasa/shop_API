class ItemChatsController < ApplicationController
  before_action :authorize!
  def create
    text = ItemChat.new(item_chat_params)
    text.item_id = params[:item_id]
    text.user_id = current_user.id
    text.save
    serializer = ItemChatSerializer.new(text)
    render json: serializer.as_json
  end

  def update
    text = ItemChat.find(params[:id])
    text.update!(item_chat_params)
    serializer = ItemChatSerializer.new(text)
    render json: serializer.as_json
  end

  def destroy
    text = ItemChat.find(params[:id])
    text.destroy!
    render json: {'message': '正常にUser削除されました'}
  end

  def show
    text = ItemChat.find(params[:id])
    serializer = ItemChatSerializer.new(text)
    render json: serializer.as_json
  end

  def index
    texts = ItemChat.all
    texts = texts.where(item_id: params[:item_id])
    serializer = ActiveModel::Serializer::CollectionSerializer.new(texts,serializer:ItemChatSerializer)
    render json: serializer.as_json
  end

  def item_chat_params
    params.require(:item_chat_params).permit(
      :text
    )
  end


end
