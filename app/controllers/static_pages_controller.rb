class StaticPagesController < ApplicationController
  def home
  end

  def aboutus
  end

  def faq
  end
  
  def paid
    
    @order = Order.find_by(id: params[:id])
    @order.update_attribute(:status, "Paid by User: #{current_customer.email}")
    
    
    
  end
end
