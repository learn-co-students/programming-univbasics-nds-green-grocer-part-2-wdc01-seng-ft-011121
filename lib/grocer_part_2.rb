require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  temp = {}
  x = 0
  cart.length.times do
    y = 0
    coupons.length.times do
      coop = coupons[y]
      if (cart[x][:item] == coop[:item]) && (cart[x][:count] >= coop[:num])
        temp[:item] = coop[:item]+" W/COUPON"
        temp[:price] = (coop[:cost]/coop[:num])
        temp[:clearance] = cart[x][:clearance]
        temp[:count] = coop[:num]
        cart[x][:count] -= temp[:count]
        cart.push(temp)
      end
      temp = {}
      y += 1
    end
    x += 1
  end
  return cart
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  x = 0
  cart.length.times do
    if cart[x][:clearance]
      cart[x][:price] = cart[x][:price] - (cart[x][:price]*(1.0/5.0))
    end
    x += 1
  end
  return cart
  
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
  
  ans = 0
  c = consolidate_cart(cart)
  temp = apply_coupons(c,coupons)
  final = apply_clearance(temp)
  
  x = 0
  final.length.times do
    ans = ans + (final[x][:count]*final[x][:price])
    x += 1
  end
  if ans > 100
    ans = ans - (ans*(1.0/10.0))
  end
  
  return ans
  
  
end