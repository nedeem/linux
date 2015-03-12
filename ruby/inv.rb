#!/usr/bin/ruby
puts Dir.glob('**/*').each { | file | file.downcase}.sort
