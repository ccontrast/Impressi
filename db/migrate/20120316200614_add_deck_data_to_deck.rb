class AddDeckDataToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :deck_data, :string

  end
end
