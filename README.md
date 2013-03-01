systemd-htop-service
=====================

This is a systemd service to start htop on a virtual terminal
(aka /dev/ttyN).

INTRODUCTION
=====================
This service was developed to add htop to a virtual terminal
using the new systemd service. The default is set to tty12, but
can be modified via YaST /etc/sysconfig editor and changed to 11.

The udev rules are configured to use only these vt's at present.

INSTALLATION
=====================
For openSUSE >= 12.1 only at present via rpm as there are rpm
macros that run to install the sysconfig and systemd service.
There is a simple Makefile included that can be modified for other
distributions.


NOTE: You WILL need to trigger udev before starting the service for
the first time...

udevadm trigger

MODIFYING THE SERVICE
=====================
At present the /usr/lib/udev/rules.d/10-tty.rules file is hardcoded to
user htopd and the tty group, also /usr/lib/systemd/system/htop.service
to htopd.

If you want to run as a different user the udev rules file needs to
be manually edited to match the name set in the htop.service file
AND the user needs to be added to the tty group.

You will then need to reload via;

systemctl --system daemon-reload
systemctl restart htop.service

And check all is ok via;

systemctl status htop.service

CONTACTING THE AUTHOR
=====================
I can be contacted at: malcolmlewis -at- opensuse -dot- org
