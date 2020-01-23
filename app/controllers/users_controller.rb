class UsersController < ApplicationController


  def index
    query = User.all
    query = query.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
    if params[:query].present?
      query.where("name like'%"+ params[:query] + "%'").where("bio like '%" + params[:query] + "%'").uniq
    end
    serializer = ActiveModel::Serializer::CollectionSerializer.new(query,serializer:UserSerializer)
    render json: serializer.as_json
  end

  def show
    user = User.find(params[:id])
    serializer = UserSerializer.new(user)
    render json: serializer.as_json
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    serializer = UserSerializer.new(user)
    render json: serializer.as_json
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: {'message': '正常にUser削除されました'}
  end

  def user_params
    params.require(:user_params).permit(
      :name,
      :bio
    )
  end
end
