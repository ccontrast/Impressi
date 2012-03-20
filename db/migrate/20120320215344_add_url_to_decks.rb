class AddUrlToDecks < ActiveRecord::Migration
  def change
    change_column :decks, :deck_data, :text, :limit => 10000
  end
end
