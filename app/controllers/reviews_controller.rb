class ReviewsController < ApplicationController


  def show
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
  end

  def new
    if user_signed_in?
      @game = Game.find(params[:game_id])
      @review = Review.new
    end
  end

  def create
    if user_signed_in?

      @game = Game.find(params[:game_id])
      @review = Review.new(review_params)

      @review.game = @game

      if @review.save
        flash[:notice] = "New Review added"
        redirect_to @game
      else
        flash[:alert] = "Review not added, please fix"
        render :new
      end
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])

    if user_signed_in?
      if @review.update_attributes(review_params)
        flash[:notice] = "Review updated"
        redirect_to game_path(@game)
      else
        flash[:alert] = "Review not updated, please fix"
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if user_signed_in?
      @review.destroy
      flash[:notice] = "Review was deleted"
      redirect_to game_path(params[:game_id])
    end
  end

  private


  def review_params
    params.require(:review).permit(
      :title,
      :body,
      :user_id,
      :username
    )
  end

end
