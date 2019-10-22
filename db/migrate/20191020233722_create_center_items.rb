class CreateCenterItems < ActiveRecord::Migration[5.2]
  def change
    create_table :center_items do |t|
      t.integer :quantity, default: 0
      t.references :item, foreign_key: true
      t.references :center, foreign_key: true

      t.timestamps
    end
  end
end
