class AddGstAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :gst_amount, :decimal
  end
end
