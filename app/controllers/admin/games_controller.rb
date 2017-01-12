class Admin::GamesController < ApplicationController
  before_filter :authorize_admin!
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path,
    notice: 'Game was successfully deleted'
  end

end
