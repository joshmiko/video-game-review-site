class GamesController < ApplicationController
  before_action :set_game,
  only: [:show, :edit, :update, :destroy]


  def index
    @games = Game.all
  end

  def show
  end

  def new
    if user_signed_in?
      @game = Game.new
    end
  end

  def create
    if user_signed_in?
      @game = Game.new(game_params)
      if @game.save
        flash[:notice] = "New Game added"
        redirect_to games_path
      else
        flash[:alert] = "Game not added, please fix"
        render :new
      end
    end
  end

  private

  def set_game
      @game = Game.find(params[:id])
    end

  def game_params
    params.require(:game).permit(
      :name,
      :developer,
      :genre,
      :comments
    )
  end


end
