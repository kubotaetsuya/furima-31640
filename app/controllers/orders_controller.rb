class OrdersController < ApplicationController
  before_action :set_item_id, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create 
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :shipping_area_id, :city, :block, :building, :phone_number).merge(token: params[:token], item: @item, user: @item.user_id)
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],  
      card: params[:token],   # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
