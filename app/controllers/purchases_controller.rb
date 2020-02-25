class PurchasesController < ApplicationController
  before_action :authorize!
  before_action :set_item
  before_action :status_check, only:[:create]
  before_action :check_auth_update, only:[:destroy]

  def create
    purchase = Purchase.new
    purchase .item = @item
    purchase.user = current_user
    purchase.save
    @item.status = "true"
    @item.save
    serializer = PurchaseSerializer.new(purchase)
    render json: serializer.as_json
  end

  def destroy
    @item.update!(status:"false")
    @item.purchase.destroy!
    render json: {"message":"購入を取り消ししました"}
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def status_check
    if @item.status == true
        raise ActionController::BadRequest.new("購入済です")
    end
  end

  def check_auth_update
    purchase = @item.purchase
    if purchase.user != current_user
        raise ActionController::BadRequest and return
    end
  end
end
