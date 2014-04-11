class Game < ActiveRecord::Base
  has_many :guesses

  before_validation :upcase_word

  validates :word_chooser, presence: true
  validates :guesser, presence: true
  validates :word, length: { :minimum => 5, :maximum => 8 }


  protected

  def upcase_word
    self.word = word.upcase if word
  end
end
