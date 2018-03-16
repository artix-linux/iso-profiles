Version=0.7

PREFIX = /usr/local
SYSCONFDIR = /etc

LXQT = \
	$(wildcard lxqt/Packages-*) \
	lxqt/profile.conf

install_profile:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/lxqt
	install -m0644 ${LXQT} $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/lxqt

uninstall_profile:
	for f in ${LXQT}; do rm -f $(DESTDIR)$(PREFIX)/share/artools/iso-profiles/lxqt/$$f; done

install: install_profile

uninstall: uninstall_profile

dist:
	git archive --format=tar --prefix=iso-profiles-$(Version)/ $(Version) | gzip -9 > iso-profiles-$(Version).tar.gz
	gpg --detach-sign --use-agent iso-profiles-$(Version).tar.gz

.PHONY: install uninstall dist
