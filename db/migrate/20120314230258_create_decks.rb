class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :user_id
      t.text :html_source

      t.timestamps
    end
  end
end
