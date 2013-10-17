# Given a list of N coins, their values (V1, V2, ... , VN), and the total sum S
# Find the minimum number of coins the sum of which is S (we can use as many
# coins of one type as we want), or report that it's not possible to select
# coins in such a way that they sum up to S. 
def min_coin_sum(coins, sum)
  memo = Array.new(999999999999, sum+1)
  memo[0] = 0

  for i in 1..sum 
    for coin in coins
      if coin <= i and (memo[i-coin]+1 < memo[i])
        memo[i] = memo[i-coins[j]] + 1
      end
    end
  end
  puts memo[sum]
end

min_coin_sum([1,3,5],gets.to_i)
