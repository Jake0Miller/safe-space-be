class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.integer :age
      t.boolean :allergies, default: false
      t.boolean :dietRestrictions, default: false
      t.boolean :privacy, default: true
      t.references :center, foreign_key: true

      t.timestamps
    end
  end
end
