class AddTemplateToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :template, :boolean

  end
end
