class EvaluationController < ApplicationController
  before_action :authorize!
  before_action :set_item

  def create
    evaluation = Evaluation.new(evaluation_params)
    evaluation.item = @item
    evaluation.evaluated = @item.user
    evaluation.evaluator = current_user
    evaluation.save
    serializer = EvaluationSerializer.new(evaluation)
    render json: serializer.as_json
  end

  def index
    user = User.find_by(id: params[:id])
    evaluation = user.evaluated
    status = evaluation.group(:status).count(:status)
    serializer = ActiveModel::Serializer::CollectionSerializer.new(evaluation,serializer:EvaluationSerializer)
    render json: {
      "status": status,
      "evaluation":serializer
    }
  end

  def evaluation_params
    params.require(:evaluation_params).permit(
      :status,
      :text
    )
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end
end
