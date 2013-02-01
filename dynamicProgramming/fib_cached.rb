require "benchmark"
@f = []

def fib_c(n)
  if @f[n].nil?
    @f[n] = fib_c(n-1) + fib_c(n-2)
  end
  @f[n]
end

def fib_c_driver(n)
  @f[0] = 0
  @f[1] = 1
  fib_c(n)
end

p fib_c_driver(gets.to_i)
time = Benchmark.realtime do
  fib_c(5000)
end
puts "Time elapse #{time*1000} milliseconds"
