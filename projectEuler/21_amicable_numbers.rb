require 'set'
def sum_of_divisors(n)
  divisors = divisors(n)
  divisors.inject{ |result, element| result + element }
end
def divisors(n)
  result = [1]
  ciel = Math.sqrt(n).to_i + 1
  (2..ciel).each do |d|
    if n%d == 0
      result << d
      result << n/d
    end
  end
  result.sort
end
def find_amicable(n)
  result = Set.new
  temp = []
  (2..n).each do |n|
    a = sum_of_divisors(n)
    b = sum_of_divisors(a)
    if n == b and n != a
      result << n
      result << a
      temp << [n,a]
    end
  end
  puts temp.inspect
  result
end
#puts divisors(4)
puts find_amicable(10000).inspect
puts find_amicable(10000).inject{ |r,e| r+e }
