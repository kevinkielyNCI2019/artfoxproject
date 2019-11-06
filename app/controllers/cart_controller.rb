class CartController < ApplicationController
  
  #start of add to cart logic
  
  #before_action :authenticate_user!
  
  
  def add
    # get the Id of the product
    id = params[:id]
    
   # if the cart is already been created, use existing cart else create a blank cart
  if session[:cart] then
    cart = session[:cart]
  else
    session[:cart] = {}
    cart = session[:cart]
  end
  #If the product is already added it increments by 1 or else product set to 1
  if cart[id] then
    cart[id] = cart[id] + 1
  else
    cart[id]= 1
  end  
  
    redirect_to :action => :index
  
  end
  
  
  
  #### start of index logic
  
  def index
    # passes a cart to display
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end  
  end
  
  #### clear the cart ####
  def clearCart
    #sets session variable to nil and bring back to index
    session[:cart] = nil
    redirect_to :action => :index
  end 
  
  ##### remove from the cart #####
  def remove
    
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :action => :index
  end
  
#### Here is the Cart Create Order code

def createOrder
 # Step 1: Get the current user
 @customer = Customer.find(current_customer.id)
 
 # Step 2: Create a new order and associate it with the current user
       @order = @customer.orders.build(:order_date => DateTime.now, :status => 'Pending')
       @order.save
  
  # Step 3: For each artwork in the cart, create a new item on the order!!
       @cart = session[:cart] || {} # Get the content of the Cart
       @cart.each do | id | #### QUANTITY REMOVED!!
       artwork = Artwork.find_by_id(id)
       @orderartwork = @order.orderartworks.build(:artwork_id => artwork.id, :title => artwork.title, :cat => artwork.cat, :desc => artwork.desc, :price=> artwork.price, :sold => artwork.sold)
       @orderartwork.save
     
       
       end
       
       @orders = Order.all
    
    
    @orderartworks = Orderartwork.where(order_id: Order.last)
    
    session[:cart] = nil
       
       
end
  
  
end
