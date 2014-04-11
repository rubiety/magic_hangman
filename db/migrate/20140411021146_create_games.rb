class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :word_chooser
      t.string :guesser
      t.boolean :won
      t.timestamps
    end
  end
end
