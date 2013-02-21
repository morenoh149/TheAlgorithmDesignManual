module Ops
  MATCH  = 0
  INSERT = 1
  DELETE = 2
end

def string_compare(s,t,i,j)
  opt = []
  return i * indel(' ') if j == 0 
  return j * indel(' ') if i == 0

  opt[Ops::MATCH]  = string_compare(s,t,i-1,j-1) + match(s[i-1],t[j-1])
  opt[Ops::INSERT] = string_compare(s,t,i,j-1) + indel(t[j-1])
  opt[Ops::DELETE] = string_compare(s,t,i-1,j) + indel(s[i-1])
  opt.min
end

# returns the cost of (in)serting or (del)eting the given character
def indel(char)
  1
end

# returns the cost of matching or substituting a character
def match(a,b)
  a == b ? 0 : 1
end

s = gets.chomp
t = gets.chomp
print string_compare(s,t,s.length,t.length)
