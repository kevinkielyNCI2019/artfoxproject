class Order < ApplicationRecord
    
def order_params
        params.require(:order).permit( :order_date, :customer_id, :status)
end
    
  
 has_many :orderartworks
  belongs_to :customer
end
