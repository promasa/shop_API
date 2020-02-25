class UsersController < ApplicationController
  before_action :authorize!
  before_action :set_user, only:[:update, :destroy]
  before_action :check_auth_update, only:[:update, :destroy]

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
    user = User.find_by(id: params[:id])
    serializer = UserSerializer.new(user)
    render json: serializer.as_json
  end

  def update
    @user.update!(user_params)
    serializer = UserSerializer.new(@user)
    render json: serializer.as_json
  end

  def destroy
    @user.destroy!
    render json: {'message': '正常にUser削除されました'}
  end

  def user_params
    params.require(:user_params).permit(
      :name,
      :bio
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_auth_update
    if @user.user_id != current_user.id 
        raise ActionController::BadRequest and return
    end
  end


end
