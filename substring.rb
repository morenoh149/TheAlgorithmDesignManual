# Write a program to determine whether an input string find is a substring of
# another input string y
def hasSubstring(find,y)
  find = find.split(//)
  y = y.split(//)
  if find == y
    return true
  end

  for i in 0..(y.length-1) do
    foundNonMatch = false
    for j in 0..(find.length-1) do
      puts i.to_s + " and " + j.to_s
      if y[i+j] != find[j]
        foundNonMatch = true
        break
      end
    end
    if !foundNonMatch
      return true
    end
  end
  false
end

p hasSubstring(gets.chomp,gets.chomp)
