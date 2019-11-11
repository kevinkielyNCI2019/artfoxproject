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
    
    #@artworks = Orderartwork.where(order_id: params[:id])
      #@artworks.each do | id | 
       #@artwork = Artwork.find_by_id(id)
    
    
   # @artwork.update_attribute(:sold, true)
  #end
  end
end
