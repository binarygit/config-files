#enable alias expansion so that
#vim recognizes aliases
shopt -s expand_aliases

#alias for listing directories
alias eu="ls"

#alias for opening multiple files as tabs
alias vp="vim -p"

#alias for tmuxinator
alias mux="tmuxinator"

#alias for rubocop
alias copx="rubocop -x"
alias cop="rubocop"

#alias for displaying date
alias dt="date"

#alias for clearing the terminal screen
alias cr="clear"

#alias for clearing the terminal screen
alias pk="pulseaudio -k"

#alias for opening in gui
alias o="xdg-open"
alias on='vim ~/Documents/notes/notes.txt'

#alias for getting into folders i usually work on
alias doc="cd ~/Documents/"

#alias for editing and running test.rb 
alias vtest="vim test.rb"
alias rtest="ruby test.rb"

#alias for setting and d-setting redshift
alias rb="redshift -O 4000"
alias rbx="redshift -x"

#alias for merging .Xresources
alias xm="xrdb -merge ~/.Xresources"

#alias for loading changes in bashrc
alias lb="source ~/.bashrc"

#alias for tmux
alias t='TERM=xterm-256color tmux'
alias tks='tmux kill-session'
alias tas='tmux attach'
alias teu='tmux ls'

#alias for opening bash_alias
alias oa='vim /home/kali/.bash_aliases'


# all stuff rails
alias r='rails'
alias rmi='rails db:migrate'
alias rsb='rails console --sandbox'
alias bx="bundle exec rspec"
alias rs='redis-server'
alias upm='rails stimulus:manifest:update'

# aliases for sampleapp
alias dos='cd ~/Documents/ror-tutorial/sample_app'
alias dosc='cd ~/Documents/ror-tutorial/sample_app/app/controllers'
alias dosm='cd ~/Documents/ror-tutorial/sample_app/app/models'
alias dost='cd ~/Documents/ror-tutorial/sample_app/test'
alias dosti='cd ~/Documents/ror-tutorial/sample_app/test/integration'
alias dostc='cd ~/Documents/ror-tutorial/sample_app/test/controllers'
alias doss='cd ~/Documents/ror-tutorial/sample_app/app/assets/stylesheets'
alias dosv='cd ~/Documents/ror-tutorial/sample_app/app/views'

# aliases for open food network
alias doo='cd ~/Documents/openfoodnetwork'
alias doov='cd ~/Documents/openfoodnetwork/app/views'
alias doop='cd ~/Documents/openfoodnetwork/app/views/admin/reports/filters'
alias dooj='cd ~/Documents/openfoodnetwork/app/assets/javascripts'
alias doow="cd ~/Documents/openfoodnetwork/app/webpacker/controllers"
alias doovo="cd ~/Documents/openfoodnetwork/app/views/spree/admin/orders"
alias doojo="cd ~/Documents/openfoodnetwork/app/assets/javascripts/admin/spree/orders"

alias ff='fzf'
alias ll='ls -l --color=auto -h'

alias olib='cd ~/.rbenv/versions/3.2.1/lib/ruby/3.2.0'
alias owb='cd ~/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/webrick-1.8.1'
# alias to scrape jobs and push to github
alias sap="scrape-and-push"

# delete migration files
alias rmig='rm db/migrate/20230724052043_create_campaign_consolidations.rb db/migrate/20230724052044_migrate_company_surveys_to_assessments.rb db/migrate/20230809064421_add_fields_to_campaign_consolidation.rb
'
