#!/usr/bin/env ruby

# given an array of stock prices, effeciently find the best
# point to buy an sell at to maximize profit

num_of_mins_in_day = 60*24
stockPricesYesterday = Array.new(num_of_mins_in_day)
stockPricesYesterday.map! { |p| rand(100000) }

def find_best_deal(stockPrices)
  minPrice = stockPrices[0]
  maxProfit = 0
  stockPrices.each do |p|
    minPrice = [minPrice, p].min
    maxProfit = [maxProfit, p - minPrice].max
  end
  maxProfit
end

puts find_best_deal(stockPricesYesterday)
