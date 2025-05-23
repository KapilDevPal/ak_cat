class CreateBhajans < ActiveRecord::Migration[8.0]
  def change
    create_table :bx_block_god_bhajans do |t|
      t.references :god, null: false, foreign_key: { to_table: :bx_block_god_gods }
      t.string :bhajan_type, null: false
      t.text :text, null: false
      t.string :title
      t.string :language
      t.text :translation
      t.text :meaning

      t.timestamps
    end
  end
end 