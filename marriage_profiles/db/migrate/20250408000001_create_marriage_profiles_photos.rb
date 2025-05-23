class CreateMarriageProfilesPhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :marriage_profiles_photos do |t|
      t.references :profile, null: false, foreign_key: { to_table: :marriage_profiles_profiles }
      t.string :image_url
      t.integer :position
      t.boolean :is_primary, default: false

      t.timestamps
    end
  end
end 