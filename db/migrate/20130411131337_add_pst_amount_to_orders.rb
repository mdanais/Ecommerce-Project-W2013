class AddPstAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pst_amount, :decimal
  end
end
