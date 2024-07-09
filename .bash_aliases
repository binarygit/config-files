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
alias or='vim /home/kali/.rails_aliases.bash'

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

alias lo='mux olumo-s && mux olumo'
alias lf='mux fluid-s && mux fluid'
alias lofn='mux ofn-s && mux ofn'

alias gu="git stash && git co staging && git fetch jarvis && git merge jarvis/staging && bundle && yarn"

alias h="heroku"
alias bcf="backup-config-files"

function backup-config-files() {
  cp ~/.bash_aliases ~/.bashrc ~/.gitattributes ~/.gitconfig ~/.gitignore ~/.irbrc ~/.rdbgrc ~/.tmux.conf ~/.vimrc ~/.Xauthority ~/.Xdefaults ~/.Xresources ~/Documents/important-config-files 
  cd ~/Documents/important-config-files
  git add .
  git ci -m "Updated at $(date)"
  git push
}

function hoa() {
 h open -a $1
}

function ha {
  h apps -t olumo
}

function hc {
  if [ "$#" -eq 0 ]; then
    heroku run bin/rails console -a olumo-staging 
  else
    heroku run bin/rails console -a $1 
  fi
}

function sm {
  ag '(private|def )' $1 | less
}

# Starts a server at port 3000
function www {
  ruby -run -e httpd . -p 3000
  # alternatively, to specify another root file: ruby -run -e httpd -- --port=8080 index.rb
  # docs at: https://www.rubydoc.info/stdlib/un/toplevel:httpd
  # If you're confused about the -run method it's actually, -r un (referencing the un lib):
  # https://stackoverflow.com/questions/48354843/explain-ruby-run-e-httpd
}
