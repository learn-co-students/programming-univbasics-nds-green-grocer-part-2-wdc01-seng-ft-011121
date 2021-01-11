require_relative './part_1_solution.rb'

# def apply_coupons(cart, coupons)
#   # Consult README for inputs and outputs
#   #
#   # REMEMBER: This method **should** update cart
  
#   coupon_cart = []
#   cart.each do |cart_item|
#     coupons.each do |coupon_item|
#     if cart_item[:item] == coupon_item[:item] && cart_item[:count] >= coupon_item[:num]
#       discounted_item = {:item => "#{cart_item[:item]} W/COUPON", :price => coupon_item[:cost] / coupon_item[:num], :clearance => cart_item[:clearance], :count => coupon_item[:num]}
#       cart_item[:count] = cart_item[:count] - coupon_item[:num]
#       if  cart_item[:count] > 0
#         remainder_item = {:item => cart_item[:item], :price => cart_item[:price], :clearance => cart_item[:clearance], :count => cart_item[:count] - coupon_item[:num]}
#         coupon_cart.push(remainder_item)
#       end
#       coupon_cart.push(discounted_item)
#     else
#       coupon_cart.push(cart_item)
#     end
#     end
#   end
#   cart.push(coupon_cart)
# return cart.flatten!
  
# end


def apply_coupons(cart, coupons)
  cart.each do |cart_item|
    coupons.each do |coupon_item|
     if cart_item[:item] == coupon_item[:item] && cart_item[:count] >= coupon_item[:num]
      cart.push({:item => "#{cart_item[:item]} W/COUPON", :price => coupon_item[:cost] / coupon_item[:num], :clearance => cart_item[:clearance], :count => coupon_item[:num]})
      cart_item[:count] -= coupon_item[:num]
     end
    end
  end
  cart
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.map do |cart_item|
    if cart_item[:clearance]
      cart_item[:price] *= 0.80
      cart_item[:price].round(2)
    end
  end
  cart
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  
  cart.map do |cart_item|
    if cart_item[:clearance]
      cart_item[:price] *= 0.80
      cart_item[:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  couped_cart = apply_coupons(new_cart, coupons)
  total = apply_clearance(couped_cart).sum do |e|
    (e[:price] * e[:count]).round(2)
  end
  if total > 100
    (total = total *= 0.90).round(2)
  end
  total
  
end
