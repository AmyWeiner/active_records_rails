
Infrastructure
--

AWS OpsWorks seems to be a useful tool to manage apps/deployments. Can't get app to run, smells like heroku.

###install ruby/rails
[ec2-user@ip-10-144-137-165 ~]$ \curl -L https://get.rvm.io | bash -s stable --rails --ruby

###nokogiri
There are problems:
http://nokogiri.org/tutorials/installing_nokogiri.html

###node
install node, nvm and coffee


###memcached
(not used … using memory_store)

set max size:
http://www.alphadevx.com/a/387-Changing-the-maximum-item-size-allowed-by-Memcache

###precompile
RAILS_ENV=production bundle exec rake assets:precompile

###bower package manager
http://bower.io/