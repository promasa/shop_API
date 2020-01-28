class PrivateChatsController < ApplicationController
  before_action :authorize!
  def create
    from_id = current_user.id
    to_id = params[:private_chat_params][:to_id]
    private_chat = PrivateChat.new
    private_chat.from_id = from_id
    private_chat.to_id = to_id
    private_chat.text = params[:private_chat_params][:text]
    private_chat.room_id = create_room_id(from_id,to_id)
    private_chat.save
    serializer = PrivateChatSerializer.new(private_chat)
    render json: serializer.as_json
  end

  def show
    my_room_id = create_room_id(current_user.id , params[:id])
    texts = PrivateChat.where(room_id: my_room_id)
    serializer = ActiveModel::Serializer::CollectionSerializer.new(texts,serializer:PrivateChatSerializer)
    render json: serializer.as_json
  end

  def private_chat_params
    params.require(:private_chat_params).permit(
      :to_id,
      :text
    )
  end

  def create_room_id(first_user, second_user)
    first_id = first_user.to_i
    second_id = second_user.to_i
    if first_id < second_id
      "#{first_id}-#{second_id}"
    else
      "#{second_id}-#{first_id}"
    end
  end

  def get_user_id(room_id)
    room_user_id = room_id.split('-')
    @first_id = room_user_id[0].to_i
    @second_id = room_user_id[1].to_i
  end

end
