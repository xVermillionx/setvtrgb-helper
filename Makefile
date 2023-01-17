#!/bin/sh

# VTPATH=/sys/module/vt/parameters/
INSTALLDIR=/opt/vtrgb-helper
FILE=FILE
SERVICEF=vtrgb-helper.service

build:
	@./hexToVTRGBHelper.bash example.color

install: build
	@(setvtrgb --help >/dev/null 2>&1 || (echo "Dependency setvtrgb not installed!" && exit 1)) && \
	install -m 0755 -o root -d "$(INSTALLDIR)"                                                  && \
	install -m 0644 -o root "$(FILE)" "$(INSTALLDIR)"
	install -m 0644 -o root $(SERVICEF) /etc/systemd/system
	systemctl daemon-reload
	systemctl enable $(SERVICEF)

uninstall:
	systemctl disable $(SERVICEF)
	rm -rf "/etc/systemd/system/$(SERVICEF)"
	rm -rf "$(INSTALLDIR)"
	# systemctl daemon-reload

clean:
	rm -rf FILE
	rm -rf default_{blu,grn,red}

