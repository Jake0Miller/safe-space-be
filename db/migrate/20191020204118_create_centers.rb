class CreateCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :centers do |t|
      t.string :name
      t.string :address
      t.string :lat
      t.string :lng
      t.string :phone
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
