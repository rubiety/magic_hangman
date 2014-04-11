class Guess < ActiveRecord::Base
  belongs_to :game

  before_validation :upcase_letter

  validates :letter, :format => { :with => /\A[A-Za-z\-]{1}\Z/, :message => "should be a letter or hypen" }

  before_create :calculate_correct


  protected

  def upcase_letter
    self.letter = letter.upcase if letter
  end

  def calculate_correct
    self.correct = (game.word.split(//) - game.guesses.map(&:letter)).include?(letter)
    true
  end

end
