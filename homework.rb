#encoding: utf-8
num = ARGV.first.to_i
sqrt = Math.sqrt(num)

unless sqrt==sqrt.to_i
  puts 'wtf?'
  exit
end
sqrt = sqrt.to_i

matrix = Array.new(sqrt)
0.upto(sqrt-1) do |y|
  matrix[y] = Array.new(sqrt)
end

if sqrt%2==0
  x = y = (sqrt/2) -1
else
  x = y = sqrt/2.round
end

matrix[x][y] = 1

circle, num = 1, 1
while circle < sqrt do

  #четное
    circle = circle + 1

    #четное наверх
      x = x + 1
      next_y = y+circle - 1

      y.upto(next_y) do |by|
        num = num + 1
        matrix[by][x] = num
      end
      y = next_y


    #четное налево
      x = x - 1
      next_x = x - circle + 2
      x.downto(next_x) do |bx|
        num = num + 1
        matrix[y][bx] = num
      end

      x = next_x

  if circle < sqrt
    #нечетное
      circle = circle + 1

      #нечетное вниз
        x = x - 1
        next_y = y-circle + 1
        y.downto(next_y) do |by|
          num = num + 1
          matrix[by][x] = num
        end
        y = next_y

      #нечетное направо
        x = x + 1
        next_x = x + circle - 2

        x.upto(next_x) do |bx|
          num = num + 1
          matrix[y][bx] = num
        end

        x = next_x

    end
end

(sqrt-1).downto(0) do |y|
  puts matrix[y].join('    ')
end