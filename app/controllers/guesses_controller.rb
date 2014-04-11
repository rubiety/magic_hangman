class GuessesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(guess_params)

    if @guess.save
      if @game.failed_game?
        flash[:confirm] = "You lose!"
        redirect_to new_game_path
      elsif @game.guessed_word?
        flash[:confirm] = "You win!"
        redirect_to new_game_path
      else
        flash[:confirm] = @guess.correct? ? "Correct!" : "Wrong."
        redirect_to @game
      end
    else
      render "games/show"
    end
  end


  protected

  def guess_params
    params.require(:guess).permit(:letter)
  end
end
