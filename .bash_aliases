#enable alias expansion so that
#vim recognizes aliases
shopt -s expand_aliases

source '/home/kali/.rails_aliases.bash'

# use bat
alias cat="bat"
alias man="batman"

#alias for listing directories
alias eu="ls"

#alias for tmuxinator
alias mux="tmuxinator"

#alias for rubocop
alias copx="rubocop -x"
alias copa="rubocop -a"
alias cop="rubocop"

#alias for displaying date
alias dt="date"
alias cr="clear"

#alias for ensuring sound works
alias pk="pulseaudio -k"

#alias for opening in gui
alias o="xdg-open"

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
alias er='vim /home/kali/.rails_aliases.bash'

# all stuff rails
alias r='rails'
alias bx="bundle exec rspec"
alias rs='redis-server'
alias upm='rails stimulus:manifest:update'

alias ff='fzf'

alias lc='mux comm-s && mux comm'

# NOTE: These aren't used currently because I don't use heroku at work anymore.
# I think they'll be useful again so I've kept them here.

# alias h="heroku"

# function hoa() {
#  h open -a $1
# }

# function ha {
#   h apps -t olumo
# }

# function hc {
#   if [ "$#" -eq 0 ]; then
#     heroku run bin/rails console -a olumo-staging 
#   else
#     heroku run bin/rails console -a $1 
#   fi
# }

# checkout a PR
# function copr {
#   gh pr checkout $1
# }

# show method. Displays methods in a ruby file.
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

# Aliases for commish
alias rat="r t test/controllers/ test/models/ test/jobs/ test/integration test/mailers -dq"
