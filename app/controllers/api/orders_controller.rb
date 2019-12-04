module Api
  class OrdersController < ApplicationController
    before_action :authorize_request, except: :create
    # POST /order
    def create
      @order = Order.new(order_params)
      @order.save
      if @order.save
        @payload = detail_order_params
        @payload.each do |order_detail|
          @order_detail = OrderDetail.new
          @order_detail.quantity = order_detail[:qty]
          @order_detail.order_id = @order.id
          @order_detail.detail_model_id = order_detail[:detail_model_id]
          unless @order_detail.save
            render json: { errors: @order_detail.errors.full_messages },
              status: :unprocessable_entity
            return
          end 
        end
        render json: {
                order: @order,
                detail_orders: @order.order_details
              }, status: :created
      else
        render json: { errors: @order.errors.full_messages },
              status: :unprocessable_entity
      end
    end

    private

    def order_params
      params.permit(
          :status, :address, :phone_number, :payment_id, :receive_name, :payment_type_id, :shipping_type_id,
          :user_id
      )
    end

    def detail_order_params
      params[:payload]
    end
  end
end