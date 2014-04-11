class Game < ActiveRecord::Base
  has_many :guesses

  validates :word_chooser, presence: true
  validates :guesser, presence: true
  validates :word, length: { :minimum => 5, :maximum => 8 }

end
