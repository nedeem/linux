#
#	Execute from terminal with 'rake sshit.rake get_server_info' or 'rake get_server_info'
#	SSHKIT gem from Capistrano is required
#

require 'sshkit'
require 'sshkit/dsl'

SSHKit::Backend::Netssh.configure do |ssh|
  ssh.ssh_options = {
      user: 'root',
      auth_methods: ['publickey']
  }
end

desc 'Get Server Info'
task :get_server_info do

  on 'localhost' do
    as :root do
      puts capture(:df, '-h')
      puts capture(:env)
      puts capture(:uname, '-a')
    end
  end

end
