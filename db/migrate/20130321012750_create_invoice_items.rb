class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :taxes
      t.decimal :total

      t.timestamps
    end
  end
end
