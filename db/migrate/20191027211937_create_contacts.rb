class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.boolean :notify
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
