class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  def index
    @orders = Order.all
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(
          :status, :address, :phone_number, :payment_id, :receive_name, :payment_type_id, :shipping_type_id,
          :user_id, :price
      )
    end
end
