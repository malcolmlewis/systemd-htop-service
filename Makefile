#   Simple makefile for systemd-htop-service
#
#   Copyright (c) 2012-2021 Malcolm J Lewis <malcolmlewis@opensuse.org>
#
#   License: GPL-2.0
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License Version 2.0 as
#   published by the Free Software Foundation.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License 2.0 for more details.
#

DATADIR=/usr/share
LIB=/usr/lib
LOCALSTATEDIR=/var
FILLUPDIR=$(DATADIR)/fillup-templates
PREFIX=
SYSCONFDIR=
SYSCONFIGDIR=
UDEVRULESDIR=$(LIB)/udev/rules.d
UNITDIR=$(LIB)/systemd/system
RULESFILE=10-tty.rules
SERVICEFILE=htop.service
SYSCONFFILE=sysconfig.htop

all: systemd-htop-service

install:
	mkdir -p $(DESTDIR)$(UDEVRULESDIR)
	install -m 0644 $(RULESFILE) $(DESTDIR)$(UDEVRULESDIR)/
	mkdir -p $(DESTDIR)$(UNITDIR)
	install -m 0644 $(SERVICEFILE) $(DESTDIR)$(UNITDIR)/
	mkdir -p $(DESTDIR)$(FILLUPDIR)
	install -m 0644 $(SYSCONFFILE) $(DESTDIR)$(FILLUPDIR)/
