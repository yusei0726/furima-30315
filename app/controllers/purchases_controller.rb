class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end
private
  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :municiparity, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
