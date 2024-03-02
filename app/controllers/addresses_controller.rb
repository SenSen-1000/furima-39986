class AddressesController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address = Address.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_dc0dc740f3d0f19b780f23ea"
    Payjp::Charge.create(
      amount: address_params[:price],
      card: address_params[:token],   
      currency: 'jpy'
    )
  end

end
