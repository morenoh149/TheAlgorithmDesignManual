# parses a mines file, returns an array of arrays, each mine is an array of
# form: x, y, blast_radius
def parse(filename)
  result = []
  File.open(filename,'r') do |file|
    for line in file
      result << line.split(' ').map(&:to_i)
    end
  end
  result
end

# for every mine, 1) blow it up 2) find all mines with blast_radius
# 3) repeat until no more mines are blown up 4) return number of mines
# blown up
def detonate(mines)
  result = []
  for x in 0...mines.length
    result << detonate_mine(x,mines)
  end
  result
end

# given a mine index and an array of mines, recursively detonate them
def detonate_mine(x,mines)
  a = []
  a << compare(x,mines)
  for i in 0...mines.length
    if a[0][i]
      a << compare(i,mines)
    end
  end
#a # at this point a is an array of all the detonations that would happen
  a = a.inject { |result, element| array_or(result,element) }
  a.select{ |x| x }.count
end


# given two boolean arrays, returns the or of them, for any index if any
# of the array values at that index is true return true
def array_or(a,b)
  c = []
  for i in 0...a.length
    if a[i] or b[i]
      c[i] = true
    else
      c[i] = false
    end
  end
  c
end

# given an index for a mine in the mines array, return an array with true's
# for the mines that are within blast radius
def compare(index, mines)
  my_mine = mines[index]
  result = []
  for mine in mines
    result << within_blast_radius(my_mine[0],my_mine[1],my_mine[2],
                                  mine[0],mine[1])
  end
  result
end
      
def within_blast_radius(x1, y1, blast_radius, x2, y2)
  ((x1 - x2) ** 2 + (y1 - y2) ** 2) <= (blast_radius ** 2)
end

mines = parse("example_mines.txt")
#puts compare(8,mines).inspect
#puts array_or([true,false,true,false],[true,false,false,true])
#puts detonate_mine(9,mines)
puts detonate(
