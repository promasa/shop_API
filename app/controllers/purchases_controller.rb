class PurchasesController < ApplicationController
  before_action :authorize!
  before_action :set_item
  before_action :status_check

  def create
    purchase = Purchase.new(purchase_params)
    purchase.user_id = current_user.id
    purchase.save
    @item.status = "true"
    @item.save
    serializer = PurchaseSerializer.new(purchase)
    render json: serializer.as_json
  end

  def update
    @item.update!(status:"true")
    purchase = Purchase.find_by(item_id: params[:purchase_params][:item_id])
    purchase.destroy!
    render json: {"message" : "購入を取り消ししました"}
  end

  def purchase_params
    params.require(:purchase_params).permit(
      :item_id
    )
  end

  def set_item
    @item = Item.find_by(id: params[:purchase_params][:item_id])
  end

  def status_check
    if @item.status == true
        raise ActionController::BadRequest.new("購入済です")
    end
  end

end
