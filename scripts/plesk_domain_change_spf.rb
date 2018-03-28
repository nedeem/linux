#!/usr/bin/env rvm-auto-ruby
#
# This script takes a list of domains, check if ther mail.domain a records is pointed
# to old_ip_address and if so creates new spf records, deletes old spf records, and changed
# the plesk's ip mail service for that domain

require 'open3'

old_ip_address = "xx.xx.xx.xx"
new_ip_address = "xx.xx.xx.xx"
spf_hostname = "FQDN"
old_spf = "v=spf1 +a +mx ip4:#{old_ip_address} -all"
new_spf = "v=spf1 +a +mx ip4:#{new_ip_address} +a:#{spf_hostname} -all"

domain = %w[ domain0.com
domain2.com
domain3.com ]


domain.each do |d|
  stdout, stderr, status = Open3.capture3("dig +short a mail.#{d}")
  if stdout.include?ip_address
    puts d + " " + stdout
    # Create SPF
    system("/usr/local/psa/bin/dns", "-a", "#{d}", "-txt", new_spf)
    # Delete SPF
    system("/usr/local/psa/bin/dns", "-d", "#{d}", "-txt", old_spf)
    # Switch Domains's DNS service OFF and back ON
    system("/usr/local/psa/bin/dns --off #{d}")
    system("/usr/local/psa/bin/dns --on #{d}")
    # Change Domain's IP address
    system("plesk bin site -u #{d} -mail-service-ip #{new_ip_address}")
  else
  #  puts d + " do nothing " + stdout
 end
end
