#!/usr/bin/env rvm-auto-ruby
#
# Generate 100 unique usernames, convert them to lowercase, insert them all into a single array named 'usernames'
# Install faker gem with: gem install faker
#

require 'faker'

usernames = Array.new

100.times do
  usernames << Faker::Name.unique.first_name.downcase
end

usernames.sort

# Save to file
File.open("usernames.txt", "a") do |f|
    f.puts(usernames)
end

usernames.sort!

# Save to file
File.open("usernames2.txt", "a") do |f|
    f.puts(usernames)
end
