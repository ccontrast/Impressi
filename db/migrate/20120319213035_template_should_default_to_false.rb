class TemplateShouldDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :decks, :template, :boolean, :default => false
  end
end
