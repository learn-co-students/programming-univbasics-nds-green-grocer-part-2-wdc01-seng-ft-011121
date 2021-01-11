require_relative './part_1_solution.rb'

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
