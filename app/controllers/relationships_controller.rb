class RelationshipsController < ApplicationController
  before_action :authorize!
  before_action :set_user

  def create
    relationship = Relationship.new
    relationship.follower = current_user
    relationship.followed = @user
    relationship.save!
    render json: {"message": "フォローしました"}
  end

  def destroy
    relationship = current_user.active_relationships.find_by(followed_id: @user.id)
    relationship.destroy!
    render json: {"messafe": "フォロー解除しました"}
  end



  def set_user
    @user = User.find_by(id: params[:id])
  end
end
