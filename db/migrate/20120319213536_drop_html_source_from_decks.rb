class DropHtmlSourceFromDecks < ActiveRecord::Migration
  def change
    remove_column :decks, :html_source
  end
end
