# you can buy an unlimited number of oobleck boxes, each box has a fixed length
# M, each box can hold M^d units of oobleck. Given an amount of oobleck and
# the length of boxes sold, find how many different ways there are to buy
# e.g., ooblecks = 7, M = 2, output = 6

@powers = []
def find_ooblecks(total, m)
  exp = 0
  divisor = m**exp
  while divisor <= total
    @powers << divisor
    exp += 1
    divisor = m**exp
  end
  find_combs(total, @powers)
end
def find_combs(total, p)
  printf "total: %d, powers: %s\n", total, p.inspect
  count = 0
  for power in p
    if total % power == 0
      count += 1
    else
      diff = total-power
      count += find_combs(diff,@powers.select{|v| v<=diff})
    end
  end
  count
end

puts find_ooblecks(gets.strip.to_i,gets.strip.to_i)
puts @powers.inspect
