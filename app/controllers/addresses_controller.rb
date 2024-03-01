class AddressesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number)
  end

end
