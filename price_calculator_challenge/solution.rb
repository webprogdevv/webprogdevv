class Inventory

def enter_item
puts "\n"
puts "Item     Unit price        Sale price"
puts "--------------------------------------"
puts "Milk      $3.97            2 for $5.00"
puts "Bread     $2.17            3 for $6.00"
puts "Banana    $0.99"
puts "Apple     $0.89"
puts "\n"

puts "Please enter all the items purchased separated by a comma"
name = gets
@purchase_array = name.chomp.split(",");
@bill_customer = @purchase_array.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
puts "\n"
puts "Item     Quantity      Price"
puts "--------------------------------------"
calculate_item
end

def calculate_item
item_total = 0
save_total = 0
sub_total = 0
real_total = 0
@bill_customer.each do |key, value|
  if key=="banana"
   item_total = (value * 0.99)
  elsif key=="apple"
   item_total = (value * 0.89)
  elsif key=="milk"
   if value > 1
     item_total = (value / 2 * 5.00) + (value % 2 * 3.97 )
   else
     item_total = (value * 3.97)
   end
     real_total = value * 3.17
  else
   if value > 2
     item_total = (value / 3 * 6.00) + (value % 3 * 2.17 )
   else
     item_total = (value * 2.17)
   end
    real_total = value * 2.17
  end
   sub_total += item_total
   if real_total > 0
     save_total += real_total - item_total
   end  
  puts "#{key}      #{value}       #{item_total}"
  item_total = 0
  real_total =0
end
puts "\n\n"
puts "Total Price : #{sub_total}"
puts "\n"
puts "You saved #{save_total} today."
end

end 
Inventory.new.enter_item










