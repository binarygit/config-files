class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
  alias lm local_methods

  def cr
    system 'clear'
  end
end

IRB.conf[:SAVE_HISTORY] = 5000

# does not work correctly
#IRB.conf[:USE_AUTOCOMPLETE] = false

#require 'katakata_irb' rescue nil
