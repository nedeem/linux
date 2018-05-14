require 'faker'
a = Array.new

100.times do
  a << Faker::Name.unique.first_name.downcase
end

puts a.sort
