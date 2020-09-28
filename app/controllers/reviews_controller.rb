class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @reviews = Review.joins(:order).where("orders.vaccine_id = ?", params[:vaccine_id])
    @vaccine = Vaccine.find(params[:vaccine_id])
  end

  def new
    @review = Review.new
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.find(params[:order_id])
    @review = Review.new(review_params)
    @review.order = @order

    if @review.save
      redirect_to order_path(@order)
    else
      render "orders/show"
    end
  end

  def review_params
    params.require(:review).permit(%i[stars description])
  end
end
