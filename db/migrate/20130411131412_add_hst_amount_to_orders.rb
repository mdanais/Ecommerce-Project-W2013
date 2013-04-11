class AddHstAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :hst_amount, :decimal
  end
end
