require 'set'
def abundant?(n)
  n < divisors(n).inject{|r,e| r+e}
end
def divisors(n)
  if n == 2
    return [1]
  end
  result = Set.new << 1
  ciel = Math.sqrt(n).to_i + 1
  (2..ciel).each do |d|
    if n%d == 0
      result << d
      result << n/d
    end
  end
  result.sort
end

# find all abundant numbers less than 28123 + 1
for x in (1..28123)
  puts "#{x}: #{abundant?(x)}"
end
