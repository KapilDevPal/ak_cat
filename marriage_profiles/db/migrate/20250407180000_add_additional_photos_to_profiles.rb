class AddAdditionalPhotosToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :marriage_profiles_profiles, :photo2, :string
    add_column :marriage_profiles_profiles, :photo3, :string
  end
end 