#!/usr/bin/env rvm-auto-ruby
#
# Generate 100 unique usernames, convert them to lowercase, insert them all into a single array named 'usernames'
#

require 'faker'

usernames = Array.new

100.times do
  usernames << Faker::Name.unique.first_name.downcase
end

puts usernames.sort
