class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render :action => :new
    end
  end

  def show
  end


  protected

  def game_params
    params.require(:game).permit(:word_chooser, :guesser, :word)
  end
end
