def factorial(n)
  (1..n).inject(:*)
end

def digit_sum(n)
  n = n.to_s.split(//)
  n.collect!{|x| x.to_i}
  n.reduce(:+)
end

p digit_sum(factorial(100))
