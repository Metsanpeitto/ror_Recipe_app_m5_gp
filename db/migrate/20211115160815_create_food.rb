class CreateFood < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true,index: true
      t.string :name
      t.integer :measurement_unit
      t.integer :price
     
      t.timestamps
    end
  end
end
