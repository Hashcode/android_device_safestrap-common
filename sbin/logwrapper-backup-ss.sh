#!/sbin/sh
# By: Hashcode
# Last Edit: 12/28/2012
HIJACK_BIN=logwrapper
if [ -d "/tmp/safestrap" ]; then
	rm -rf /tmp/safestrap
fi
if [ -f "/tmp/$HIJACK_BIN" ]; then
	rm /tmp/$HIJACK_BIN
fi
if [ -f "/tmp/$HIJACK_BIN.bin" ]; then
	rm /tmp/$HIJACK_BIN.bin
fi
cp -R /system/etc/safestrap /tmp/
cp /system/bin/$HIJACK_BIN /tmp/
cp /system/bin/$HIJACK_BIN.bin /tmp/

