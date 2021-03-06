class StoreController < ApplicationController
skip_before_action :authorize
=begin

def increment_count
  if session[:counter].nil?
    session[:counter] = 0
  end
  session[:counter] += 1
end
Another way to increment session count
=end

  include CurrentCart
  before_action :set_cart
  def index
  	@products = Product.order(:title)
  	@count = increment_count
    @shown_message= "You've been here #{@count} times" if session[:counter]>5
  end
  def increment_count
  	session[:counter]||=0
  	session[:counter]+=1
  end

end
