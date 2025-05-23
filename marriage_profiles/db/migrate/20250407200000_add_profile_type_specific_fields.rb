class AddProfileTypeSpecificFields < ActiveRecord::Migration[7.0]
  def change
    # Common fields
    add_column :marriage_profiles_profiles, :first_name, :string
    add_column :marriage_profiles_profiles, :last_name, :string
    
    # Marriage profile fields
    add_column :marriage_profiles_profiles, :religion, :string
    add_column :marriage_profiles_profiles, :caste, :string
    add_column :marriage_profiles_profiles, :income, :string
    add_column :marriage_profiles_profiles, :height, :string
    add_column :marriage_profiles_profiles, :marital_status, :string
    add_column :marriage_profiles_profiles, :family_details, :text
    add_column :marriage_profiles_profiles, :preferences, :text
    add_column :marriage_profiles_profiles, :verified_status, :boolean, default: false
    
    # Professional profile fields
    add_column :marriage_profiles_profiles, :title, :string
    add_column :marriage_profiles_profiles, :company, :string
    add_column :marriage_profiles_profiles, :skills, :text
    add_column :marriage_profiles_profiles, :experience, :text
    add_column :marriage_profiles_profiles, :portfolio_links, :text
    add_column :marriage_profiles_profiles, :resume, :string
    add_column :marriage_profiles_profiles, :contact_email, :string
    add_column :marriage_profiles_profiles, :availability, :string
    
    # Generic profile fields
    add_column :marriage_profiles_profiles, :hobbies, :text
    add_column :marriage_profiles_profiles, :social_links, :text
    add_column :marriage_profiles_profiles, :availability_status, :string
    add_column :marriage_profiles_profiles, :cover_image, :string
  end
end 