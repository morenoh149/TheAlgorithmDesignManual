# returns true if the letter index given is not allowed to be the final
# letter in a word or to be followed by some jth letter j >= 2*i
def bad?(i,n)
  2 * (i+1) <= n
end

# returns true if the given letter, j, is allowed to immediately follow the
# first letter i
def follows?(j,i,n)
  if 2 * (i+1) > n
    'O'
  elsif (j+1) >= 2 * (i+1)
    'O'
  else
    'X'
  end
end

# returns the number of possible words in a language. Takes alphabet length
# and word size
def count(n,m)
  if n == 1
    1
  elsif m == 1
    n  
  else
    alphabet = Array.new(n){ |i| bad?(i,n) }
    puts alphabet.inspect
    alphabet = Array.new(n){ |i| i}
    for x in 0...n
      result = alphabet.inject('') do |result, i|
        result << " " << follows?(x,i,n)
      end
      puts "#{x+1} : #{result}"
    end
  end
end
count(9,3)

#str = $stdin.read.split("\n")
#testcases = str[0].to_i
#for x in 0...testcases
#  line = str[x+1]
#  line = line.split(" ")
#  n = line[0]
#  m = line[1]
#  puts "#{n} #{m}"
#end
