def fib_ultimate(n)
  back2 = 0
  back1 = 1

  if n == 0
    0
  end
  for i in 2..n
    next_num = back1 + back2
    back2 = back1
    back1 = next_num
  end
  back1+back2
end

p fib_ultimate(gets.to_i)
