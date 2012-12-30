#!/sbin/sh
# By: Hashcode
# Last Edit: 12/28/2012
HIJACK_BIN=logwrapper
if [ -d "/tmp/safestrap" ] && [ -f "/tmp/logwrapper" ]; then
	# clear out old safestrap
	if [ -d "/system/etc/safestrap" ]; then
		rm -R /system/etc/safestrap
	fi
	mkdir -p /system/etc/

	cp -R /tmp/safestrap /system/etc/
	chown -R root.shell /system/etc/safestrap
	chmod 755 /system/etc/safestrap/bbx
	chmod 755 /system/etc/safestrap/safestrapmenu

	if [ ! -d "/system/bin" ]; then
		mkdir -p /system/bin
		chown -R root.shell /system/bin
		chmod 755 /system/bin
	fi
	if [ ! -f "/system/bin/$HIJACK_BIN.bin" ]; then
		if [ -f "/system/bin/$HIJACK_BIN" ]; then
			mv /system/bin/$HIJACK_BIN /system/bin/$HIJACK_BIN.bin
		else
			cp /tmp/$HIJACK_BIN.bin /system/bin/$HIJACK_BIN.bin
		fi
		chown root.shell /system/bin/$HIJACK_BIN.bin
		chmod 755 /system/bin/$HIJACK_BIN.bin
	fi
	cp /tmp/$HIJACK_BIN /system/bin/$HIJACK_BIN
	chown root.shell /system/bin/$HIJACK_BIN
	chmod 755 /system/bin/$HIJACK_BIN

	# Check for support bins: [, cp, chmod, chown
	cd /system/bin
	if [ ! -f "[" ] || [ ! -f "cp" ] || [ ! -f "chmod" ] || [ ! -f "chown" ] || [ ! -f "sh" ]; then
		if [ ! -f "bbx" ]; then
			cp /sbin/bbx /system/bin/bbx
			chown root.shell /system/bin/bbx
			chmod 755 /system/bin/bbx
		fi
		if [ ! -f "[" ]; then
			ln -s bbx [
		fi
		if [ ! -f "cp" ]; then
			ln -s bbx cp
		fi
		if [ ! -f "chmod" ]; then
			ln -s bbx chmod
		fi
		if [ ! -f "chown" ]; then
			ln -s bbx chown
		fi
		if [ ! -f "sh" ]; then
			ln -s bbx sh
		fi
	fi
fi

# clear out old files
#rm -rf /tmp/safestrap
#rm /tmp/logwrapper*

