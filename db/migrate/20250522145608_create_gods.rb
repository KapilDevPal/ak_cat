class CreateGods < ActiveRecord::Migration[8.0]
  def change
    create_table :bx_block_god_gods do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :role
      t.string :category
      t.string :consort_of
      t.string :avatar_of

      t.timestamps
    end
  end
end
