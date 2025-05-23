class CreateBxBlockGodGods < ActiveRecord::Migration[8.0]
  def change
    create_table :bx_block_god_gods do |t|
      t.string :name, null: false
      t.string :sanskrit_name
      t.text :description, null: false
      t.text :significance
      t.string :festivals
      t.string :temples
      t.string :mantras
      t.string :image_url

      t.timestamps
    end
    
    add_index :bx_block_god_gods, :name, unique: true
  end
end 