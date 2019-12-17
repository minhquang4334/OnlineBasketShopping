class DashboardController < ApplicationController
  def index
    @day_orders = Order.recent.group_by{|order| order.created_at.to_date}
    @day_categories = []
    @revenue_categories = []
    @sales_categories = []
    @day_orders.each do |day, orders|
      @day_categories.unshift(day.strftime("%Y-%m-%d"))
      day_revenue = 0
      day_sales = 0
      orders.each do |order|
        day_revenue += order.price
        order.order_details.each do |order_detail|
          day_sales += order_detail.quantity
        end
      end
      @revenue_categories.unshift(day_revenue)
      @sales_categories.unshift(day_sales)
    end
  end


end
