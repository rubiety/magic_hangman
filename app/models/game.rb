class Game < ActiveRecord::Base
  has_many :guesses

  before_validation :upcase_word

  validates :word_chooser, presence: true
  validates :guesser, presence: true
  validates :word, length: { :minimum => 5, :maximum => 8 }

  def letters
    word.split(//)
  end
  
  def guessed_letter?(letter)
    guesses.correct.map(&:letter).include?(letter)
  end

  def guessed_word?
    (letters - guesses.correct.map(&:letter)).empty?
  end

  def failed_game?
    guesses.incorrect.count >= 6
  end

  protected

  def upcase_word
    self.word = word.upcase if word
  end
end
