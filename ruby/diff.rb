#!/usr/bin/ruby
inventory_old = File.open('inventory1').readlines
inventory_new = File.open('inventory2').readlines
puts "\n"
puts "Dodane su: "
puts inventory_new - inventory_old
puts "\n"
puts "Zibrisane su: "
puts inventory_old - inventory_new
