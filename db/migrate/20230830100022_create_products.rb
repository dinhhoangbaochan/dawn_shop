class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :brand, null: false, foreign_key: true
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5

      t.timestamps
    end
  end
end
