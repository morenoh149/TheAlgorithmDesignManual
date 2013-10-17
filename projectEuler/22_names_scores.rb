def parse(filename)
  names = []
  File.open(filename,'r') do |file|
    for line in file
      names = line.split(',').map{ |n| n.slice!(1...-1) }
    end
  end
  names.sort!
end

@chr_values = Hash.new
@count = 1
('A'..'Z').each do |chr|
  @chr_values[chr] = @count
  @count += 1
end

def name_val(name)
 name.split(//).map{|x| @chr_values[x]}.inject{|r,e| r+e }
end

name_scores = parse("names.txt").map{|name| name_val(name)}
sum = 0
for x in 0...name_scores.length
  sum += name_scores[x] * (x+1)
end
puts sum
