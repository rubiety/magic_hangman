class AddWordToGame < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.string :word
    end
  end
end
