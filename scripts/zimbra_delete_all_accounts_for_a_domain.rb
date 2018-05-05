#!/usr/bin/env ruby
#
# This scripts gets all accounts for a domain thath you specify and deletes them
#
#
require 'open3'

# Define domain string
domain = "domain_name.com"

# Populate accounts varaible with list of users
stdout, stderr, status = Open3.capture3("zmprov -l gaa #{domain}")

# Enable this if you need to get the data type of stdout variable
# puts stdout.class

# .each method works with Arrays only, so we use split method to convert each new line to an array element
# then with an block we iterate and run a system command that deletes a given user
stdout.split("\n").each do |a|
  system ("zmprov da #{a}")
end
