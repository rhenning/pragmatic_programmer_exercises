def cmd_P(pen)
  puts "selected pen #{pen}"
end

def cmd_D
  puts "pen down"
end

def cmd_U
  puts "pen up"
end

def cmd_W(length)
  puts "moved west #{length} cm"
end

def cmd_E(length)
  puts "moved east #{length} cm"
end

def cmd_N(length)
  puts "moved north #{length} cm"
end

def cmd_S(length)
  puts "moved south #{length} cm"
end

def process(input)
  input.each_line do |line|
    match_data = /([A-z])\s*([0-9]?)/.match(line)
    command, argument = match_data[1], match_data[2]
    if argument.empty?
      send("cmd_#{command}")
    else
      send("cmd_#{command}", argument)
    end
  end
end

input = <<-EOS
 P 2  # select pen 2
 D    # pen down
 W 2  # draw west 2cm
 N 1  # then north 1
 E 2  # then east 2
 S 1  # then back south
 U    # pen up 
EOS

process(input)
