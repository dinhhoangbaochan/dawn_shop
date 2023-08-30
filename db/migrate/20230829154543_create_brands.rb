class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5

      t.timestamps
    end
  end
end
