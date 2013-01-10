
config FREETZ_BUSYBOX__MANDATORY
	bool "mandatory"
	select FREETZ_BUSYBOX_ADDGROUP
	select FREETZ_BUSYBOX_ADDUSER
	select FREETZ_BUSYBOX_ADJTIMEX
	select FREETZ_BUSYBOX_ASH
	select FREETZ_BUSYBOX_ASH_ALIAS
	select FREETZ_BUSYBOX_ASH_BASH_COMPAT
	select FREETZ_BUSYBOX_ASH_BUILTIN_ECHO
	select FREETZ_BUSYBOX_ASH_BUILTIN_PRINTF
	select FREETZ_BUSYBOX_ASH_BUILTIN_TEST
	select FREETZ_BUSYBOX_ASH_EXPAND_PRMT
	select FREETZ_BUSYBOX_ASH_JOB_CONTROL
	select FREETZ_BUSYBOX_ASH_OPTIMIZE_FOR_SIZE
	select FREETZ_BUSYBOX_AWK
	select FREETZ_BUSYBOX_BASENAME
	select FREETZ_BUSYBOX_BB_SYSCTL
	select FREETZ_BUSYBOX_BRCTL
	select FREETZ_BUSYBOX_CAT
	select FREETZ_BUSYBOX_CHMOD
	select FREETZ_BUSYBOX_CHOWN
	select FREETZ_BUSYBOX_CLEAR
	select FREETZ_BUSYBOX_CP
	select FREETZ_BUSYBOX_CROND
	select FREETZ_BUSYBOX_CRYPTPW
	select FREETZ_BUSYBOX_CUT
	select FREETZ_BUSYBOX_DATE
	select FREETZ_BUSYBOX_DD
	select FREETZ_BUSYBOX_DELGROUP
	select FREETZ_BUSYBOX_DELUSER
	select FREETZ_BUSYBOX_DF
	select FREETZ_BUSYBOX_DIRNAME
	select FREETZ_BUSYBOX_DMESG
	select FREETZ_BUSYBOX_DU
	select FREETZ_BUSYBOX_ECHO
	select FREETZ_BUSYBOX_ENV
	select FREETZ_BUSYBOX_EXPR
	select FREETZ_BUSYBOX_FALSE
	select FREETZ_BUSYBOX_FEATURE_ADDUSER_TO_GROUP
	select FREETZ_BUSYBOX_FEATURE_ALLOW_EXEC
	select FREETZ_BUSYBOX_FEATURE_AUTOWIDTH
	select FREETZ_BUSYBOX_FEATURE_BASH_IS_NONE
	select FREETZ_BUSYBOX_FEATURE_BRCTL_SHOW if FREETZ_BUSYBOX_FEATURE_BRCTL_FANCY
	select FREETZ_BUSYBOX_FEATURE_BUFFERS_GO_ON_STACK
	select FREETZ_BUSYBOX_FEATURE_CHECK_TAINTED_MODULE
	select FREETZ_BUSYBOX_FEATURE_DATE_COMPAT
	select FREETZ_BUSYBOX_FEATURE_DATE_ISOFMT
	select FREETZ_BUSYBOX_FEATURE_DD_SIGNAL_HANDLING
	select FREETZ_BUSYBOX_FEATURE_DEL_USER_FROM_GROUP
	select FREETZ_BUSYBOX_FEATURE_DEVPTS
	select FREETZ_BUSYBOX_FEATURE_DMESG_PRETTY
	select FREETZ_BUSYBOX_FEATURE_DU_DEFAULT_BLOCKSIZE_1K
	select FREETZ_BUSYBOX_FEATURE_EDITING
	select FREETZ_BUSYBOX_FEATURE_FIND_DEPTH
	select FREETZ_BUSYBOX_FEATURE_FIND_EXEC
	select FREETZ_BUSYBOX_FEATURE_FIND_GROUP
	select FREETZ_BUSYBOX_FEATURE_FIND_INUM
	select FREETZ_BUSYBOX_FEATURE_FIND_MAXDEPTH
	select FREETZ_BUSYBOX_FEATURE_FIND_MMIN
	select FREETZ_BUSYBOX_FEATURE_FIND_MTIME
	select FREETZ_BUSYBOX_FEATURE_FIND_NEWER
	select FREETZ_BUSYBOX_FEATURE_FIND_NOT
	select FREETZ_BUSYBOX_FEATURE_FIND_PAREN
	select FREETZ_BUSYBOX_FEATURE_FIND_PATH
	select FREETZ_BUSYBOX_FEATURE_FIND_PERM
	select FREETZ_BUSYBOX_FEATURE_FIND_PRINT0
	select FREETZ_BUSYBOX_FEATURE_FIND_PRUNE
	select FREETZ_BUSYBOX_FEATURE_FIND_REGEX
	select FREETZ_BUSYBOX_FEATURE_FIND_SIZE
	select FREETZ_BUSYBOX_FEATURE_FIND_TYPE
	select FREETZ_BUSYBOX_FEATURE_FIND_USER
	select FREETZ_BUSYBOX_FEATURE_FIND_XDEV
	select FREETZ_BUSYBOX_FEATURE_GETOPT_LONG
	select FREETZ_BUSYBOX_FEATURE_GREP_CONTEXT
	select FREETZ_BUSYBOX_FEATURE_GREP_EGREP_ALIAS
	select FREETZ_BUSYBOX_FEATURE_GREP_FGREP_ALIAS
	select FREETZ_BUSYBOX_FEATURE_HTTPD_AUTH_MD5
	select FREETZ_BUSYBOX_FEATURE_HTTPD_BASIC_AUTH
	select FREETZ_BUSYBOX_FEATURE_HTTPD_CGI
	select FREETZ_BUSYBOX_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR
	select FREETZ_BUSYBOX_FEATURE_HTTPD_ENCODE_URL_STR
	select FREETZ_BUSYBOX_FEATURE_HUMAN_READABLE
	select FREETZ_BUSYBOX_FEATURE_HWIB
	select FREETZ_BUSYBOX_FEATURE_IFCONFIG_BROADCAST_PLUS
	select FREETZ_BUSYBOX_FEATURE_IFCONFIG_HW
	select FREETZ_BUSYBOX_FEATURE_IFCONFIG_STATUS
	select FREETZ_BUSYBOX_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN
	select FREETZ_BUSYBOX_FEATURE_IFUPDOWN_IPV4
	select FREETZ_BUSYBOX_FEATURE_IFUPDOWN_MAPPING
	select FREETZ_BUSYBOX_FEATURE_INIT_SYSLOG
	select FREETZ_BUSYBOX_FEATURE_IPC_SYSLOG
	select FREETZ_BUSYBOX_FEATURE_KILL_REMOVED
	select FREETZ_BUSYBOX_FEATURE_KLOGD_KLOGCTL
	select FREETZ_BUSYBOX_FEATURE_LESS_BRACKETS
	select FREETZ_BUSYBOX_FEATURE_LESS_FLAGS
	select FREETZ_BUSYBOX_FEATURE_LESS_REGEXP
	select FREETZ_BUSYBOX_FEATURE_LOGREAD_REDUCED_LOCKING
	select FREETZ_BUSYBOX_FEATURE_LS_COLOR
	select FREETZ_BUSYBOX_FEATURE_LS_COLOR_IS_DEFAULT
	select FREETZ_BUSYBOX_FEATURE_LS_FILETYPES
	select FREETZ_BUSYBOX_FEATURE_LS_FOLLOWLINKS
	select FREETZ_BUSYBOX_FEATURE_LSMOD_PRETTY_2_6_OUTPUT
	select FREETZ_BUSYBOX_FEATURE_LS_RECURSIVE
	select FREETZ_BUSYBOX_FEATURE_LS_SORTFILES
	select FREETZ_BUSYBOX_FEATURE_LS_TIMESTAMPS
	select FREETZ_BUSYBOX_FEATURE_LS_USERNAME
	select FREETZ_BUSYBOX_FEATURE_MAKEDEVS_TABLE
	select FREETZ_BUSYBOX_FEATURE_MD5_SHA1_SUM_CHECK if FREETZ_BUSYBOX_SHA1SUM || FREETZ_BUSYBOX_MD5SUM
	select FREETZ_BUSYBOX_FEATURE_MOUNT_CIFS
	select FREETZ_BUSYBOX_FEATURE_MOUNT_FLAGS
	select FREETZ_BUSYBOX_FEATURE_MOUNT_FSTAB
	select FREETZ_BUSYBOX_FEATURE_MOUNT_LOOP
	select FREETZ_BUSYBOX_FEATURE_MOUNT_LOOP_CREATE
	select FREETZ_BUSYBOX_FEATURE_MOUNT_NFS
	select FREETZ_BUSYBOX_FEATURE_MOUNT_VERBOSE
	select FREETZ_BUSYBOX_FEATURE_NETSTAT_PRG
	select FREETZ_BUSYBOX_FEATURE_NON_POSIX_CP
	select FREETZ_BUSYBOX_FEATURE_PASSWD_WEAK_CHECK
	select FREETZ_BUSYBOX_FEATURE_PIDFILE
	select FREETZ_BUSYBOX_FEATURE_PIDOF_OMIT
	select FREETZ_BUSYBOX_FEATURE_PIDOF_SINGLE
	select FREETZ_BUSYBOX_FEATURE_PREFER_APPLETS
	select FREETZ_BUSYBOX_FEATURE_PS_LONG
	select FREETZ_BUSYBOX_FEATURE_PS_WIDE
	select FREETZ_BUSYBOX_FEATURE_REMOTE_LOG
	select FREETZ_BUSYBOX_FEATURE_SHADOWPASSWDS
	select FREETZ_BUSYBOX_FEATURE_SH_IS_ASH
	select FREETZ_BUSYBOX_FEATURE_SH_NOFORK
	select FREETZ_BUSYBOX_FEATURE_SH_STANDALONE
	select FREETZ_BUSYBOX_FEATURE_SKIP_ROOTFS
	select FREETZ_BUSYBOX_FEATURE_STAT_FORMAT
	select FREETZ_BUSYBOX_FEATURE_SUID
	select FREETZ_BUSYBOX_FEATURE_SYSLOG
	select FREETZ_BUSYBOX_FEATURE_TAB_COMPLETION
	select FREETZ_BUSYBOX_FEATURE_TEE_USE_BLOCK_IO
	select FREETZ_BUSYBOX_FEATURE_TELNET_AUTOLOGIN
	select FREETZ_BUSYBOX_FEATURE_TELNETD_STANDALONE
	select FREETZ_BUSYBOX_FEATURE_TELNET_TTYPE
	select FREETZ_BUSYBOX_FEATURE_TOP_CPU_GLOBAL_PERCENTS
	select FREETZ_BUSYBOX_FEATURE_TOP_CPU_USAGE_PERCENTAGE
	select FREETZ_BUSYBOX_FEATURE_TOUCH_SUSV3
	select FREETZ_BUSYBOX_FEATURE_TR_CLASSES
	select FREETZ_BUSYBOX_FEATURE_TR_EQUIV
	select FREETZ_BUSYBOX_FEATURE_UMOUNT_ALL
	select FREETZ_BUSYBOX_FEATURE_USE_INITTAB
	select FREETZ_BUSYBOX_FEATURE_USE_TERMIOS
	select FREETZ_BUSYBOX_FEATURE_VERBOSE_USAGE
	select FREETZ_BUSYBOX_FEATURE_VI_8BIT
	select FREETZ_BUSYBOX_FEATURE_VI_ASK_TERMINAL
	select FREETZ_BUSYBOX_FEATURE_VI_COLON
	select FREETZ_BUSYBOX_FEATURE_VI_DOT_CMD
	select FREETZ_BUSYBOX_FEATURE_VI_OPTIMIZE_CURSOR
	select FREETZ_BUSYBOX_FEATURE_VI_READONLY
	select FREETZ_BUSYBOX_FEATURE_VI_SEARCH
	select FREETZ_BUSYBOX_FEATURE_VI_SET
	select FREETZ_BUSYBOX_FEATURE_VI_SETOPTS
	select FREETZ_BUSYBOX_FEATURE_VI_USE_SIGNALS
	select FREETZ_BUSYBOX_FEATURE_VI_WIN_RESIZE
	select FREETZ_BUSYBOX_FEATURE_VI_YANKMARK
	select FREETZ_BUSYBOX_FEATURE_XARGS_SUPPORT_CONFIRMATION
	select FREETZ_BUSYBOX_FEATURE_XARGS_SUPPORT_QUOTES
	select FREETZ_BUSYBOX_FEATURE_XARGS_SUPPORT_TERMOPT
	select FREETZ_BUSYBOX_FEATURE_XARGS_SUPPORT_ZERO_TERM
	select FREETZ_BUSYBOX_FIND
	select FREETZ_BUSYBOX_FREE
	select FREETZ_BUSYBOX_GETOPT
	select FREETZ_BUSYBOX_GREP
	select FREETZ_BUSYBOX_HAVE_DOT_CONFIG
	select FREETZ_BUSYBOX_HEAD
	select FREETZ_BUSYBOX_HOSTNAME
	select FREETZ_BUSYBOX_HTTPD
	select FREETZ_BUSYBOX_ID
	select FREETZ_BUSYBOX_IFCONFIG
	select FREETZ_BUSYBOX_IFUPDOWN
	select FREETZ_BUSYBOX_INIT
	select FREETZ_BUSYBOX_INSMOD
	select FREETZ_BUSYBOX_INSTALL_APPLET_SYMLINKS
	select FREETZ_BUSYBOX_IOCTL_HEX2STR_ERROR
	select FREETZ_BUSYBOX_KILL
	select FREETZ_BUSYBOX_KILLALL
	select FREETZ_BUSYBOX_KLOGD
	select FREETZ_BUSYBOX_LESS
	select FREETZ_BUSYBOX_LFS if FREETZ_TARGET_LFS
	select FREETZ_BUSYBOX_LN
	select FREETZ_BUSYBOX_LOGGER
	select FREETZ_BUSYBOX_LOGIN
	select FREETZ_BUSYBOX_LOGNAME
	select FREETZ_BUSYBOX_LOGREAD
	select FREETZ_BUSYBOX_LOSETUP
	select FREETZ_BUSYBOX_LS
	select FREETZ_BUSYBOX_LSMOD
	select FREETZ_BUSYBOX_MAKEDEVS
	select FREETZ_BUSYBOX_MKDIR
	select FREETZ_BUSYBOX_MKFIFO
	select FREETZ_BUSYBOX_MKNOD
	select FREETZ_BUSYBOX_MKSWAP if FREETZ_HAS_AVM_USB_HOST
	select FREETZ_BUSYBOX_MODPROBE
	select FREETZ_BUSYBOX_MONOTONIC_SYSCALL
	select FREETZ_BUSYBOX_MORE
	select FREETZ_BUSYBOX_MOUNT
	select FREETZ_BUSYBOX_MV
	select FREETZ_BUSYBOX_NETSTAT
	select FREETZ_BUSYBOX_NO_DEBUG_LIB
	select FREETZ_BUSYBOX_NOHUP
	select FREETZ_BUSYBOX_PASSWD
	select FREETZ_BUSYBOX_PIDOF
	select FREETZ_BUSYBOX_PING
	select FREETZ_BUSYBOX_PIVOT_ROOT
	select FREETZ_BUSYBOX_PLATFORM_LINUX
	select FREETZ_BUSYBOX_PRINTF
	select FREETZ_BUSYBOX_PS
	select FREETZ_BUSYBOX_PWD
	select FREETZ_BUSYBOX_REALPATH
	select FREETZ_BUSYBOX_RESET
	select FREETZ_BUSYBOX_RM
	select FREETZ_BUSYBOX_RMDIR
	select FREETZ_BUSYBOX_RMMOD
	select FREETZ_BUSYBOX_ROUTE
	select FREETZ_BUSYBOX_SED
	select FREETZ_BUSYBOX_SETCONSOLE
	select FREETZ_BUSYBOX_SETLOGCONS
	select FREETZ_BUSYBOX_SH_MATH_SUPPORT
	select FREETZ_BUSYBOX_SHOW_USAGE
	select FREETZ_BUSYBOX_SLEEP
	select FREETZ_BUSYBOX_SORT
	select FREETZ_BUSYBOX_STAT
	select FREETZ_BUSYBOX_STTY
	select FREETZ_BUSYBOX_STUN_IP
	select FREETZ_BUSYBOX_SWAPONOFF if FREETZ_HAS_AVM_USB_HOST
	select FREETZ_BUSYBOX_SYNC
	select FREETZ_BUSYBOX_SYSLOGD
	select FREETZ_BUSYBOX_TAIL
	select FREETZ_BUSYBOX_TEE
	select FREETZ_BUSYBOX_TELNET
	select FREETZ_BUSYBOX_TELNETD
	select FREETZ_BUSYBOX_TEST
	select FREETZ_BUSYBOX_TIME
	select FREETZ_BUSYBOX_TOP
	select FREETZ_BUSYBOX_TOUCH
	select FREETZ_BUSYBOX_TR
	select FREETZ_BUSYBOX_TRUE
	select FREETZ_BUSYBOX_TTY
	select FREETZ_BUSYBOX_UMOUNT
	select FREETZ_BUSYBOX_UNAME
	select FREETZ_BUSYBOX_UNICODE_COMBINING_WCHARS if FREETZ_BUSYBOX_UNICODE_SUPPORT
	select FREETZ_BUSYBOX_UNICODE_WIDE_WCHARS if FREETZ_BUSYBOX_UNICODE_SUPPORT
	select FREETZ_BUSYBOX_UNIQ
	select FREETZ_BUSYBOX_UPTIME
	select FREETZ_BUSYBOX_USE_BB_CRYPT
	select FREETZ_BUSYBOX_USLEEP
	select FREETZ_BUSYBOX_VCONFIG
	select FREETZ_BUSYBOX_VI
	select FREETZ_BUSYBOX_WC
	select FREETZ_BUSYBOX_WHICH
	select FREETZ_BUSYBOX_XARGS
	select FREETZ_BUSYBOX_YES


config FREETZ_BUSYBOX__IPV6_UTILS
	bool "IPv6"
	select FREETZ_BUSYBOX_IP
	select FREETZ_BUSYBOX_FEATURE_IP_ADDRESS
	select FREETZ_BUSYBOX_FEATURE_IP_LINK
	select FREETZ_BUSYBOX_FEATURE_IP_ROUTE
	select FREETZ_BUSYBOX_FEATURE_IP_TUNNEL
	select FREETZ_BUSYBOX_FEATURE_IPV6

config FREETZ_BUSYBOX__PACKER
	bool "file (un)packer"
	select FREETZ_BUSYBOX_AR
	select FREETZ_BUSYBOX_BASE64
	select FREETZ_BUSYBOX_BZIP2
	select FREETZ_BUSYBOX_BUNZIP2
	select FREETZ_BUSYBOX_FEATURE_SEAMLESS_BZ2
	select FREETZ_BUSYBOX_FEATURE_SEAMLESS_GZ
	select FREETZ_BUSYBOX_FEATURE_TAR_CREATE
	select FREETZ_BUSYBOX_FEATURE_TAR_FROM
	select FREETZ_BUSYBOX_FEATURE_TAR_GNU_EXTENSIONS
	select FREETZ_BUSYBOX_GUNZIP
	select FREETZ_BUSYBOX_GZIP
	select FREETZ_BUSYBOX_TAR
	select FREETZ_BUSYBOX_UUDECODE
	select FREETZ_BUSYBOX_UUENCODE

config FREETZ_BUSYBOX__NETWORK
	bool "advanced network tools"
	select FREETZ_BUSYBOX_ARPING
	select FREETZ_BUSYBOX_ARP
	select FREETZ_BUSYBOX_ETHER_WAKE
	select FREETZ_BUSYBOX_FEATURE_AR_LONG_FILENAMES
	select FREETZ_BUSYBOX_FEATURE_TRACEROUTE_SOURCE_ROUTE
	select FREETZ_BUSYBOX_FEATURE_TRACEROUTE_USE_ICMP
	select FREETZ_BUSYBOX_FEATURE_TRACEROUTE_VERBOSE
	select FREETZ_BUSYBOX_FTPGET
	select FREETZ_BUSYBOX_FTPPUT
	select FREETZ_BUSYBOX_NC_EXTRA
	select FREETZ_BUSYBOX_NC_SERVER
	select FREETZ_BUSYBOX_NC
	select FREETZ_BUSYBOX_NSLOOKUP
	select FREETZ_BUSYBOX_RDATE
	select FREETZ_BUSYBOX_TRACEROUTE
	select FREETZ_BUSYBOX_WGET
	select FREETZ_BUSYBOX_WHOIS

config FREETZ_BUSYBOX__DEVELOPER
	bool "developer tools"
	select FREETZ_BUSYBOX_CMP
	select FREETZ_BUSYBOX_DIFF
	select FREETZ_BUSYBOX_FEATURE_DIFF_BINARY
	select FREETZ_BUSYBOX_FEATURE_DIFF_DIR
	select FREETZ_BUSYBOX_FEATURE_DIFF_LONG_OPTIONS
	select FREETZ_BUSYBOX_FEATURE_DIFF_MINIMAL
	select FREETZ_BUSYBOX_HEXDUMP
	select FREETZ_BUSYBOX_MD5SUM
	select FREETZ_BUSYBOX_OD
	select FREETZ_BUSYBOX_PATCH
	select FREETZ_BUSYBOX_SPLIT
	select FREETZ_BUSYBOX_STRINGS

config FREETZ_BUSYBOX__FANCY
	bool "set all fancy"
	select FREETZ_BUSYBOX_FEATURE_BRCTL_FANCY if FREETZ_BUSYBOX_BRCTL
	select FREETZ_BUSYBOX_FEATURE_DF_FANCY if FREETZ_BUSYBOX_DF
	select FREETZ_BUSYBOX_FEATURE_EDITING_FANCY_PROMPT if FREETZ_BUSYBOX_FEATURE_EDITING
	select FREETZ_BUSYBOX_FEATURE_FANCY_ECHO if FREETZ_BUSYBOX_ECHO || FREETZ_BUSYBOX_ASH_BUILTIN_ECHO || FREETZ_BUSYBOX_HUSH
	select FREETZ_BUSYBOX_FEATURE_FANCY_HEAD if FREETZ_BUSYBOX_HEAD
	select FREETZ_BUSYBOX_FEATURE_FANCY_PING if FREETZ_BUSYBOX_PING
	select FREETZ_BUSYBOX_FEATURE_FANCY_SLEEP if FREETZ_BUSYBOX_SLEEP
	select FREETZ_BUSYBOX_FEATURE_FANCY_SLEEP if FREETZ_BUSYBOX_SLEEP
	select FREETZ_BUSYBOX_FEATURE_FANCY_TAIL if FREETZ_BUSYBOX_TAIL
	select FREETZ_BUSYBOX_FEATURE_FBSET_FANCY if FREETZ_BUSYBOX_FBSET
	select FREETZ_BUSYBOX_FEATURE_IPCALC_FANCY if FREETZ_BUSYBOX_IPCALC
	select FREETZ_BUSYBOX_FEATURE_LAST_FANCY if FREETZ_BUSYBOX_LAST
	select FREETZ_BUSYBOX_FEATURE_RUN_PARTS_FANCY if FREETZ_BUSYBOX_RUN_PARTS
	select FREETZ_BUSYBOX_FEATURE_SPLIT_FANCY if FREETZ_BUSYBOX_SPLIT
	select FREETZ_BUSYBOX_FEATURE_START_STOP_DAEMON_FANCY if FREETZ_BUSYBOX_START_STOP_DAEMON
	select FREETZ_BUSYBOX_FEATURE_TASKSET_FANCY if FREETZ_BUSYBOX_TASKSET




comment ""
### busybox menuconfig starts here ##



