class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
    @review = Review.new
  end

  def new
    @order = Order.new
    @vaccine = Vaccine.find(params[:vaccine_id])
  end

  def create
    @vaccine = Vaccine.find(params[:vaccine_id])
    @order = Order.new(order_params)
    @order.unit_price = @vaccine.price
    @order.vaccine = @vaccine
    @order.user = current_user

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def order_params
    params.require(:order).permit(%i[quantity])
  end
end
