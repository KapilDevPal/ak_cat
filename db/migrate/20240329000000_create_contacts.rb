class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.string :subject
      t.string :status, default: "new"

      t.timestamps
    end
  end
end 