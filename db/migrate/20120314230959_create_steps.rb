class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.boolean :border
      t.integer :x_position
      t.integer :y_position
      t.integer :z_position
      t.integer :scale
      t.integer :rotate_x
      t.integer :rotate_y
      t.integer :rotate_z
      t.integer :deck_id
      t.integer :order_in_deck
      t.text :content

      t.timestamps
    end
  end
end
