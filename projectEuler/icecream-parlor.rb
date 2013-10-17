# takes coin sum and list of icecream prices, return two indices that sum
# up to the number of coins
# we sort the list to make finding sums efficient, then look up the
# original indicies and return those
def find_icecream(coins, icecream_list)
  sorted_list = icecream_list.sort
  ptr_a = 0
  ptr_b = sorted_list.length-1
  sum = add(sorted_list, ptr_a, ptr_b)
  while 1
    if sum == coins
      break
    elsif sum < coins
      ptr_a += 1
      sum = add(sorted_list, ptr_a, ptr_b)
    elsif sum > coins
      ptr_b -= 1
      sum = add(sorted_list, ptr_a, ptr_b)
    end
  end
  addend_a = sorted_list[ptr_a]
  addend_b = sorted_list[ptr_b]
  addend_a_index = icecream_list.index(addend_a)
  addend_b_index = icecream_list.rindex(addend_b)
  if addend_a_index > addend_b_index
    addend_a_index, addend_b_index = addend_b_index, addend_a_index
  end
  puts "#{addend_a_index + 1} #{addend_b_index + 1}"
end

def add(array,index1, index2)
  array[index1] + array[index2]
end

find_icecream(4, [2,2,4,3])
