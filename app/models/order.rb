class Order < ActiveRecord::Base
  attr_accessible :customer_id, :date
end