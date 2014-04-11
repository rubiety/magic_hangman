class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :game_id
      t.string :letter, :length => 1
      t.boolean :correct
      t.timestamps
    end
  end
end
