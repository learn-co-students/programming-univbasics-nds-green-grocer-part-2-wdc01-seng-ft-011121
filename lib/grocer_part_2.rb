require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.each {
    |individual_item|
    my_coupon = {}
    
    coupons.each { 
      |specific_coupon|
      #binding.pry
      my_coupon = specific_coupon if specific_coupon[:item] === individual_item[:item]
    }
     
     coupon_counter = 0
     
     if !my_coupon.empty?
     
       while individual_item[:count] >= my_coupon[:num] do
          coupon_counter += my_coupon[:num]
          individual_item[:count] -= my_coupon[:num]
       end
       
       my_coupon_price = my_coupon[:cost]/my_coupon[:num]
         
       cart << {
         item: "#{individual_item[:item]} W/COUPON",
         price: my_coupon_price,
         clearance: individual_item[:clearance],
         count: coupon_counter
       }
     end
     
     #***new_arr << cart - WHY DID I THINK I NEEDED YOU? ***
  }
  
  cart
  
end




def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_arr = Array.new
  #binding.pry
  cart.each {
    |individual_item|
    if individual_item[:clearance]
      clearance_value = 0.2 * individual_item[:price]
      individual_item[:price] -= clearance_value
      individual_item[:price] = individual_item[:price].round(2)
    end
    #binding.pry
    #new_arr << cart ***IS A VERY BUGGY PART OF MY CODE; I'ON KNOW WHY I HAD IT THERE!!!***
  }
  cart
end



def checkout(cart, coupons)
  #binding.pry
 #consolidated_cart = consolidate_cart(cart)
  #binding.pry
  #first_stage = apply_coupons(consolidate_cart(cart), coupons)
  #binding.pry
  
  second_stage = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))
  
  total = 0
  second_stage.each {
    |individual_item|
    total += individual_item[:price] * individual_item[:count]
  }
  
  if total > 100
    final_discount = 0.1 * total
    total -= final_discount
    total = total.round(2)
  end
  #binding.pry
  total
end
