class EvaluationSerializer < ActiveModel::Serializer
  attributes :id,
  :item_id,
  :evaluated_id,
  :evaluator_id,
  :text,
  :status,
  :created_at,
  :updated_at,
  :evaluator
  def evaluator
    evaluator = User.find_by(id: object.evaluator_id)
    UserSerializer.new(evaluator)
  end
end
