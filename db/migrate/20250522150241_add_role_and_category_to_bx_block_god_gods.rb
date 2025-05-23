class AddRoleAndCategoryToBxBlockGodGods < ActiveRecord::Migration[8.0]
  def change
    add_column :bx_block_god_gods, :role, :string
    add_column :bx_block_god_gods, :category, :string
    add_column :bx_block_god_gods, :consort_of, :string
    add_column :bx_block_god_gods, :avatar_of, :string
  end
end
