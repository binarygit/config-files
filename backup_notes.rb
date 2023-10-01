#!/usr/bin/ruby
require 'debug'

Dir.chdir('/home/kali/Documents/current/notes')
system("git add . && git ci -m 'Add notes' --quiet && git push --quiet")
