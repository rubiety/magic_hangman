class Guess < ActiveRecord::Base
  belongs_to :game

  before_validation :upcase_letter

  validates :letter, :format => { :with => /\A[A-Za-z\-]\Z/, :message => "should be a letter or hypen" }


  protected

  def upcase_letter
    self.letter = letter.upcase if letter
  end
end
