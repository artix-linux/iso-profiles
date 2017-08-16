Version=0.4

PREFIX = /usr/local
SYSCONFDIR = /etc

LXQT = \
	$(wildcard lxqt/Packages-*) \
	lxqt/profile.conf

CINNAMON = \
	$(wildcard cinnamon/Packages-*) \
	cinnamon/profile.conf

PLASMA = \
	$(wildcard plasma/Packages-*) \
	plasma/profile.conf

ITHREE = \
	$(wildcard i3/Packages-*) \
	i3/profile.conf

CINNAMON_LIGHTDM = \
	$(wildcard cinnamon/desktop-overlay/etc/lightdm/*.conf)

install_profiles:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/lxqt
	install -m0644 ${LXQT} $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/lxqt

	install -dm0755 $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/plasma
	install -m0644 ${PLASMA} $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/plasma

	install -dm0755 $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/i3
	install -m0644 ${ITHREE} $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/i3

	install -dm0755 $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/cinnamon
	install -m0644 ${CINNAMON} $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/cinnamon

	install -dm0755 $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/cinnamon/desktop-overlay/etc/lightdm
	install -m0644 ${CINNAMON_LIGHTDM} $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/cinnamon/desktop-overlay/etc/lightdm

uninstall_profiles:
	for f in ${LXQT}; do rm -f $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/lxqt/$$f; done
	for f in ${CINNAMON}; do rm -f $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/cinnamon/$$f; done
	for f in ${CINNAMON_LIGHTDM}; do rm -f $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/cinnamon/desktop-overlay/etc/lightdm/$$f; done

install: install_profiles

uninstall: uninstall_profiles

dist:
	git archive --format=tar --prefix=iso-profiles-$(Version)/ $(Version) | gzip -9 > iso-profiles-$(Version).tar.gz
	gpg --detach-sign --use-agent iso-profiles-$(Version).tar.gz

.PHONY: install uninstall dist
