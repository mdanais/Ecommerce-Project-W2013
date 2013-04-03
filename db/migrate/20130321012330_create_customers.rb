class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :province_id
      t.string :postal_code

      t.timestamps
    end
  end
end
