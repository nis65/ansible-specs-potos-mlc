#!/usr/bin/bash

# place this file in /usr/local/share/applications/anyuniquename.desktop
# if the first Entry in $ALLTERMINALS (i.e. $TERMINAL) is executable, you
# can find this file by searching for its $MAINNAME in "Activities"
# and drag it to your favorite apps.

MAINNAME="Shells"

# configure here the absolute filename of an executable command, optionally
# followed by its options. If
TERMINAL="/usr/bin/gnome-terminal --window"

# configure a line for each subcommand you want to have on the right click
# subnenu entry. The first one is also called on left click

ALLTERMINALS="localhost $TERMINAL
myhost $TERMINAL -- ssh myhost"

# create main menu entry ...
cat << EOF
[Desktop Entry]
Icon=utilities-terminal
Type=Application
Name=${MAINNAME}
EOF

# ... list of all right clik actions ...
echo -n "Actions="
first=true
echo "${ALLTERMINALS}" | while read name rest
do
  if [[ "${first}" == "true" ]]
  then
    echo -n "${name}"
    first=false
  else
    echo -n ";${name}"
  fi
done
echo ""

first=true
echo "${ALLTERMINALS}" | while read name rest
do
  if [[ "${first}" == "true" ]]
  then
    # ... its left click action
    echo "Exec=${rest}"
    echo ""
    first=false
  fi
  # And finally all Actions
  cat << EOF
[Desktop Action ${name}]
Type=application
Name=${name}
Exec=${rest}

EOF

done

