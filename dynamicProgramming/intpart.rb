@powers = []
@memo = {}
def find_ooblecks(total, m)
  exp = 0
  divisor = m**exp
  while divisor <= total
    @powers << divisor
    exp += 1
    divisor = m**exp
  end
  @powers << divisor
  p(1,total)
end
def nextPower(k)
  @powers[@powers.index(k)+1]
end
def p(k,n)
  key = k.to_s+"_"+n.to_s
  if @memo.has_key?(key)
    @memo.fetch(key)
  elsif k > n
    @memo[key] = 0
  elsif k == n
    @memo[key] = 1
  else
    @memo[key] = p(nextPower(k), n) + p(k, n-k) % 1000000007
  end
end

puts find_ooblecks(gets.chomp.to_i,gets.chomp.to_i)
