#
# Try to determine hostname (without port!) used in the HTTP request; guess if
# necessary.
#
self_host() {
	local TARGET_HOST

	# Use HTTP_REFERER to determine target host (could be a name, an
	# IP(v4), or an IPv6 literal in brackets)
	TARGET_HOST=$(echo "$HTTP_REFERER" |
		sed -n -r 's#^[^:]+://(\[[0-9a-fA-F:.]+\]|[^[/:]*).*$#\1#p')

	# Try HTTP_HOST
	if [ -z "$TARGET_HOST" ]; then
		case $HTTP_HOST in
			"["*) # IPv6 literal
				TARGET_HOST="${HTTP_HOST%]*}]" ;;
			*) # decimal IPv4 or name
				TARGET_HOST=${HTTP_HOST%:*} ;;
		esac
	fi

	# Use fritz.box as fallback
	if [ -z "$TARGET_HOST" ]; then
		TARGET_HOST=fritz.box
	fi

	echo "$TARGET_HOST"
}

#
# Redirect: Header 'Status' works with busybox's httpd; for AVM's websrv, we
# send a small HTML page. $3 is a function that may produce additional BODY
# contents.
#
redirect() {
	local location=$1 title=${2:-Redirect} body_func=${3:-true}
	local CR=$'\r'
	cat << EOF
Status: 301 Moved Permanently${CR}
Location: $location${CR}
Content-type: text/html; charset=iso-8859-1${CR}
${CR}
<html>
<head>
<title>$title</title>
<meta http-equiv="refresh" content="0;url=$location">
</head>
<body style="margin: 0px: padding: 0px; color: #b0b0b0; font-size: 10px;">
$("$body_func")
<p>Redirecting ... <a style="color: #b0b0b0;" href="$location">$title</a></p>
</body>
</html>
EOF
}
