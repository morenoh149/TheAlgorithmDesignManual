require "benchmark"

def fib_r(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib_r(n-1) + fib_r(n-2)
  end
end

p fib_r(gets.to_i)
time = Benchmark.realtime do
  (1..100).each { |i| fib_r(30) }
end
puts "Time elapsed #{time*1000} milliseconds"
