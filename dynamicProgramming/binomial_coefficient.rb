def binomial_coefficient(n,m)
  bc = []
  for i in 0..n do
    bc[i] = Array.new(m)
    bc[i][0] = 1
  end
  for j in 0..n do
    bc[j][j] = 1
  end
  for i in 2..n do
    for j in 1..(i-1) do
      bc[i][j] = bc[i-1][j-1] + bc[i-1][j]
    end
  end
  bc[n][m]
end

n = gets.to_i
m = gets.to_i
p n.to_s + " " + m.to_s
p binomial_coefficient(n,m)
