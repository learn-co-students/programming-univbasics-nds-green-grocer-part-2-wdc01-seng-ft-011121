require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_arr =[]
  cart.each {
    |individual_item|
    
     def get_applicable_coupon(passed_item, coupon_list) 
       coupon_list.each {
         |specific_coupon|
         #binding.pry
         return specific_coupon if specific_coupon[:item] == passed_item[:item]}
     end
     
     #binding.pry
     my_coupon = get_applicable_coupon(individual_item, coupons)
     #binding.pry
     coupon_counter = 0
     
     if my_coupon
       while individual_item[:count] >= my_coupon[:num] do
         coupon_counter += my_coupon[:num]
         individual_item[:count] -= my_coupon[:num]
       end
     end
     
     if coupon_counter > 0
       my_coupon_price = my_coupon[:cost]/my_coupon[:num]
       
       cart << {
         item: "#{individual_item[:item]} W/COUPON",
         price: my_coupon_price,
         clearance: individual_item[:clearance],
         count: coupon_counter
       }
       
       binding.pry
        new_arr << cart
     end
  }
  return new_arr.flatten
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
