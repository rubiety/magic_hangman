class GuessesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(guess_params)

    if @guess.save
      redirect_to @game
    else
      render "games/show"
    end
  end


  protected

  def guess_params
    params.require(:guess).permit(:letter)
  end
end
