require "pry"
def find_item_by_name_in_collection(name, collection)

#return the intire hash if equal to the argument name given
index  = 0
while index < collection.length do
  if collection[index][:item] === name
    return collection[index]
  else
    nil
  end
  index += 1
end


end

def consolidate_cart(cart)

new_array = []
index = 0

while index < cart.length do

name = cart[index][:item]
add = find_item_by_name_in_collection(name, cart)
new_array << add

if !new_array[index][:count]
  new_array[index][:count] = 1
else
  new_array[index][:count] += 1
end

index += 1

end
return new_array


  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end


def apply_coupons(cart, coupons)

index = 0
while index < coupons.length do

cart_item = find_item_by_name_in_collection(coupons[index][:item], cart)
coupons_item_name = "#{coupons[index][:item]} W/COUPON"
cart_item_with_coupon = find_item_by_name_in_collection(coupons_item_name, cart)
if coupons_item_name && cart_item[:count] >= coupons[index][:num]
  if cart_item_with_coupon
    cart_item_with_coupon[:count] += coupons[index][:num]
  else
    cart_item_with_coupon = {
      item: coupons_item_name,
      price: coupons[index][:cost] / coupons[index][:num],
      count: coupons[index][:num],
      clearance: cart_item[:clearance]

    }
    cart << cart_item_with_coupon
    cart_item[:count] -= coupons[index][:num]

  end
end
  index += 1
end
cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  index  = 0
  while index < cart.length do

    if cart[index][:clearance]
      cart[index][:price] =  cart[index][:price] - (cart[index][:price] * 20 / 100)
  end
  index += 1

  end
  cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)


index = 0
while index < cart.length do
new_cart = consolidate_cart(cart[index])
apply_coup =  apply_coupons(new_cart, coupons[index])




index += 1
end
return new_array
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
