class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
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
