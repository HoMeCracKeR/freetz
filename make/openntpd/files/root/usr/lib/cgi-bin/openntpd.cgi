#!/bin/sh


. /usr/lib/libmodcgi.sh

check "$OPENNTPD_ENABLED" yes:auto "*":man

sec_begin '$(lang de:"Starttyp" en:"Start type")'
cat << EOF
<p>
<input id="e1" type="radio" name="enabled" value="yes"$auto_chk><label for="e1"> $(lang de:"Automatisch" en:"Automatic")</label>
<input id="e2" type="radio" name="enabled" value="no"$man_chk><label for="e2"> $(lang de:"Manuell" en:"Manual")</label>
</p>
EOF
sec_end


sec_begin '$(lang de:"NTP Daemon" en:"NTP Daemon")'

cat << EOF
<h2>$(lang de:"Zus&auml;tzliche Kommandozeilen-Optionen (f&uuml;r Experten)" en:"Additional command-line options (for experts)"):</h2>
<p>$(lang de:"Optionen" en:"Options"): <input type="text" name="options" size="20" maxlength="255" value="$(html "$OPENNTPD_OPTIONS")"></p>
EOF

sec_end
