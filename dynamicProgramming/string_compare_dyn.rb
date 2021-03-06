Cell = Struct.new(:cost, :parent)

module Ops
  MATCH = 0
  INSERT = 1
  DELETE = 2
end

def array2d(width,height)
  result = Array.new(width+1)
  for i in 0..width
    result[i] = Array.new(height+1)
    for j in 0..height
      result[i][j] = Cell.new
    end
  end
  for i in 0..height
    result[0][i].cost = i
    if i>0
      result[0][i].parent = Ops::INSERT
    else
      result[0][i].parent = -1
    end
  end
  for j in 0..width
    result[j][0].cost = j
    if j>0
      result[j][0].parent = Ops::DELETE
    else
      result[j][0].parent = -1
    end
  end
  result
end

# @matrix of cell structs
@m

def string_compare(s,t)
  @m = array2d(s.length,t.length)
  opt = []
  for i in 1..s.length
    for j in 1..t.length
      opt[Ops::MATCH]  = @m[i-1][j-1].cost + match(s[i-1],t[j-1])
      opt[Ops::INSERT] = @m[i][j-1].cost + indel(t[j-1])
      opt[Ops::DELETE] = @m[i-1][j].cost + indel(s[i-1])

      @m[i][j].cost = opt[Ops::MATCH]
      @m[i][j].parent = Ops::MATCH
      for elt in Ops::INSERT..Ops::DELETE
        if opt[elt] < @m[i][j].cost
          @m[i][j].cost = opt[elt]
          @m[i][j].parent = elt
        end
      end
    end
  end
  @m[s.length][t.length].cost
end
def indel(char)
  1
end
def match(a,b)
  a == b ? 0 : 1
end

def reconstruct_path(s,t,i,j)
  if @m[i][j].parent == -1
    return
  end
  if @m[i][j].parent == Ops::MATCH
    reconstruct_path(s,t,i-1,j-1)
    match_out(s,t,i,j)
  end
  if @m[i][j].parent == Ops::INSERT
    reconstruct_path(s,t,i,j-1)
    insert_out(t,j)
  end
  if @m[i][j].parent == Ops::DELETE
    reconstruct_path(s,t,i-1,j)
    delete_out(s,i)
  end
end
def match_out(s,t,i,j)
  if s[i] == t[j] 
    print 'M'
  else
    print 'S'
  end
end
def insert_out(t,j)
  print "I"
end
def delete_out(s,i)
  print "D"
end

s = gets.chomp
t = gets.chomp

print string_compare(s,t).to_s + "\n"
puts reconstruct_path(s,t,s.length,t.length)
