require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/cafepress-search'

Hoe.plugin :newgem
$hoe = Hoe.spec 'cafepress-search' do
  self.version = Cafepress::Search::VERSION
  self.developer 'Britt Crawford', 'bcrawford@cafepress.com'
  self.developer 'Dimple Joseph', 'djoseph@cafepress.com'
  self.post_install_message = 'PostInstall.txt' 
  self.extra_deps         = ["happymapper", "0.3.0"]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

task :default => [:spec]