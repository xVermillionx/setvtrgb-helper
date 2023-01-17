#!/bin/sh

# VTPATH=/sys/module/vt/parameters/
INSTALLDIR=
FILE=
SERVICEF=kbdrate-helper.service

install:
	@(kbdrate --help >/dev/null 2>&1 || (echo "Dependency kbdrate not installed!" && exit 1)) && \
	install -m 0644 -o root $(SERVICEF) /etc/systemd/system
	systemctl daemon-reload
	systemctl enable $(SERVICEF)

uninstall:
	systemctl disable $(SERVICEF)
	rm -rf "/etc/systemd/system/$(SERVICEF)"
	# systemctl daemon-reload

clean:
	rm -rf FILE
	rm -rf default_{blu,grn,red}

