class Admin::ReviewsController < ApplicationController
  before_filter :authorize_admin!
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path,
    notice: 'Review was successfully deleted'
  end

end
