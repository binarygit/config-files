require 'rainbow'

def cr
  system 'clear'
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
  alias lm local_methods
end

IRB.conf[:SAVE_HISTORY] = 5000
# does not work correctly
IRB.conf[:COMMAND_ALIASES].merge!({ :'cr' => :clear_screen })
#IRB.conf[:USE_AUTOCOMPLETE] = false

def app_prompt
  "#{Rainbow("😎").yellow}"
end

def env_prompt
  "(#{Rainbow("%m").red})"
end

def right_arrow
  "#{Rainbow("➡️➡️").bg(:blue)}"
end

def prompt
  app_prompt + " " + env_prompt
end



IRB.conf[:PROMPT][:MY_PROMPT] = {
  PROMPT_I:  " #{prompt}#{right_arrow} ",
  PROMPT_N:  " #{prompt}#{right_arrow} ",
  PROMPT_S:  " #{prompt}#{right_arrow} ",
  PROMPT_C:  "(%m) #{Rainbow("❓").red}#{right_arrow} ",
  RETURN: "==> %s\n",
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT

require 'katakata_irb' rescue nil
