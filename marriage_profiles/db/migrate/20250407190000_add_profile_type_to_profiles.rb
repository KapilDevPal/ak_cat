class AddProfileTypeToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :marriage_profiles_profiles, :profile_type, :string, default: "marriage"
    add_index :marriage_profiles_profiles, :profile_type
  end
end 