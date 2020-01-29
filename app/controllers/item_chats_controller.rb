class ItemChatsController < ApplicationController
  before_action :authorize!
  before_action :set_text, only:[:show, :update, :destroy]
  before_action :check_auth_update, only:[:update, :destroy]

  def create
    text = ItemChat.new(item_chat_params)
    text.item_id = params[:item_id]
    text.user_id = current_user.id
    text.save
    serializer = ItemChatSerializer.new(text)
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

  def set_text
      @text = ItemChat.find(params[:id])
  end

  def check_auth_update
    if @text.user_id != current_user.id 
        raise ActionController::BadRequest and return
    end
  end

end
