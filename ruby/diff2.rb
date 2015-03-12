#!/usr/bin/ruby
unless ARGV.length == 2
  puts "Usage: diff2.tb old_file new_file"
  exit
end

# Define a method

def boring?(line)
  line.split('/').include?('temp') or
    line.split('/').include?('recycler')
puts "boring? " + line.inspect  # (1)
end 

def inventory_from(filename)
  inventory = File.open(filename) #(1)
  downcased = inventory.collect do | line | #(2)
    line.chomp.downcase
  end
  downcased.reject do | line |  #(3)
    boring?(line)
  end
end


old_file = inventory_from(ARGV[0])
new_file = inventory_from(ARGV[1])
