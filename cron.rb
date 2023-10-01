#!/usr/bin/ruby
require 'debug'
require 'whenever'

every 2.hours do
  command "ruby /home/kali/bin/backup_notes.rb"
end

every 2.hours do
  command "backup-config-files"
end
