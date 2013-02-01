def fib_dp(n)
  f = []
  f[0] = 0
  f[1] = 1
  for i in 2..n
    f[i] = f[i-1] + f[i-2]
  end
  f[n]
end

p fib_dp(gets.to_i)
