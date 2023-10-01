## Setting up programmer dvorak (ruby)
from: https://askubuntu.com/a/511142

Add layout: 
```
sudo vi /usr/share/X11/xkb/symbols/us
```

Display layout in keyboards by adding:
```
<variant>
  <configItem>
    <name>dvpr</name>
    <description>English (programmer Dvorak ruby)</description>
  </configItem>
</variant>
```

to: `sudo vi /usr/share/X11/xkb/rules/evdev.xml`

## Swap capslock and escape key
from: https://unix.stackexchange.com/a/651005

edit: `sudo vi /etc/default/keyboard`
set: `XKBOPTIONS="caps:swapescape"`

## Sourcing xterm defaults
`xrdb -merge ~/.Xresources`
