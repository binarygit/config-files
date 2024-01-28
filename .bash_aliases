#enable alias expansion so that
#vim recognizes aliases
shopt -s expand_aliases

source '/home/kali/.rails_aliases.bash'
#alias for listing directories
alias eu="ls"

#alias for tmuxinator
alias mux="tmuxinator"

#alias for rubocop
alias copx="rubocop -x"
alias cop="rubocop"

#alias for displaying date
alias dt="date"
alias cr="clear"
#alias for ensuring sound works
alias pk="pulseaudio -k"

#alias for opening in gui
alias o="xdg-open"
alias on='vim ~/Documents/notes/notes.txt'

#alias for getting into folders i usually work on
alias doc="cd ~/Documents/"
alias doo='cd ~/Documents/openfoodnetwork'
alias oou="git co master && git fetch upstream && git merge upstream/master && bundle && yarn && r db:migrate"

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
alias ora='vim /home/kali/.rails_aliases.bash'

# all stuff rails
alias r='rails'
alias bx="bundle exec rspec"
alias rs='redis-server'
alias upm='rails stimulus:manifest:update'

alias ff='fzf'
alias ll='ls -l --color=auto -h'

alias olib='cd ~/.rbenv/versions/3.2.1/lib/ruby/3.2.0'
alias owb='cd ~/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/webrick-1.8.1'
# alias to scrape jobs and push to github
alias sap="scrape-and-push"

# delete migration files
alias rmig='rm db/migrate/20230724052043_create_campaign_consolidations.rb db/migrate/20230724052044_migrate_company_surveys_to_assessments.rb db/migrate/20230809064421_add_fields_to_campaign_consolidation.rb'

alias lo='mux olumo-s && mux olumo'

alias gu="git stash && git co staging && git fetch && git merge jarvis/staging"

alias h="heroku"
alias hc="heroku run -a olumo-staging bin/rails console"
alias hg="heroku run -a olumo-new-global-filter-g6slyp bin/rails console"
alias up="./script.bash"
alias bcf="backup-config-files"

function backup-config-files() {
  cp ~/.bash_aliases ~/.bashrc ~/.gitattributes ~/.gitconfig ~/.gitignore ~/.irbrc ~/.rdbgrc ~/.tmux.conf ~/.vimrc ~/.Xauthority ~/.Xdefaults ~/.Xresources ~/important-config-files 
  cd ~/important-config-files
  git add .
  git ci -m "Updated at $(date)"
}
