new_lines = []

x_min = Float::INFINITY
y_min = Float::INFINITY
x_max = -Float::INFINITY
y_max = -Float::INFINITY
x_range = 0
y_range = 0

coord_space_range = 900

old_coords = []

ARGF.readlines.each do |line|
  no_parens = line.delete("(").delete(")").delete(" ").strip
  x,y = no_parens.split(",").map{|s| s.to_f}
  x_min = [x_min,x].min
  y_min = [y_min,y].min
  x_max = [x_max,x].max
  y_max = [y_max,y].max
  old_coords << ({x: x,y: y})
end

x_min = x_min.floor
y_min = y_min.floor
x_max = x_max.ceil
y_max = y_max.ceil

x_range = x_max - x_min
y_range = y_max - y_min

bigger_range = [x_range,y_range].max
scale_factor = coord_space_range / bigger_range

new_coords = old_coords.map do |coord|
  x = coord[:x]
  y = coord[:y]
  next ({x: (x - x_min) * scale_factor, y: (y - y_min) * scale_factor})
end

puts "X values:\n\n"
puts new_coords.map{|coord| coord[:x]}.join(" ")
puts "Y values:"
puts new_coords.map{|coord| coord[:y]}.join(" ")