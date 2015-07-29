class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nameproduct
      t.string :avatar

      t.timestamps null: false
    end
  end
end
