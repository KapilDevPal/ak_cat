class CreateMarriageProfilesProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :marriage_profiles_profiles do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :occupation
      t.string :education
      t.string :location
      t.text :bio
      t.string :photo
      t.string :passcode
      t.boolean :passcode_enabled, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end 