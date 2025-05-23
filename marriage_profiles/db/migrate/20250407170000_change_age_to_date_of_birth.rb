class ChangeAgeToDateOfBirth < ActiveRecord::Migration[7.0]
  def change
    remove_column :marriage_profiles_profiles, :age, :integer
    add_column :marriage_profiles_profiles, :date_of_birth, :date
  end
end 