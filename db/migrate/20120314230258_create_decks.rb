class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string  :name
      t.integer :user_id
      t.text    :deck_data
      t.boolean :template, :default => false

      t.timestamps
    end
  end
end
