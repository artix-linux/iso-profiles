VERSION=0.8

PKG = iso-profiles
TOOLS = artools
ifdef PREFIX
PREFIX = /usr/local
endif
SYSCONFDIR = /etc
PROFDIR = $(PREFIX)/share/$(TOOLS)/$(PKG)

BASEDIR = $(PROFDIR)/base
OVERLAYDIR = $(BASEDIR)/live-overlay$(SYSCONFDIR)
LXQTDIR = $(PROFDIR)/lxqt
LXDEDOR = $(PROFDIR)/lxde

DMODE = -dm0755
FMODE = -m0644
RM = rm -f
RMD = rm -fr --one-file-system

BASE = \
	$(wildcard base/Packages-*) \
	base/profile.conf

LIVE = \
	base/live-overlay/etc/fstab \
	base/live-overlay/etc/issue

LIVE_DEFAULT = \
	$(wildcard base/live-overlay/etc/default/*)

LIVE_PAM = \
	$(wildcard base/live-overlay/etc/pam.d/*)

LIVE_SUDOERS = \
	$(wildcard base/live-overlay/etc/sudoers.d/*)

LXQT = \
	$(wildcard lxqt/Packages-*) \
	lxqt/profile.conf

LXQT_DM = \
	lxqt/desktop-overlay/etc/sddm.conf

install-base:
	install $(DMODE) $(DESTDIR)$(BASEDIR)
	install $(FMODE) $(BASE) $(DESTDIR)$(BASEDIR)

	install $(DMODE) $(DESTDIR)$(OVERLAYDIR)
	install $(FMODE) $(LIVE) $(DESTDIR)$(OVERLAYDIR)

	install $(DMODE) $(DESTDIR)$(OVERLAYDIR)/default
	install $(FMODE) $(LIVE_DEFAULT) $(DESTDIR)$(OVERLAYDIR)/default

	install $(DMODE) $(DESTDIR)$(OVERLAYDIR)/pam.d
	install $(FMODE) $(LIVE_PAM) $(DESTDIR)$(OVERLAYDIR)/pam.d

	install $(DMODE) $(DESTDIR)$(OVERLAYDIR)/sudoers.d
	install $(FMODE) $(LIVE_SUDOERS) $(DESTDIR)$(OVERLAYDIR)/sudoers.d

install-lxqt:
	install $(DMODE) $(DESTDIR)$(LXQTDIR)
	install $(FMODE) $(LXQT) $(DESTDIR)$(LXQTDIR)
	install $(DMODE)  $(DESTDIR)$(LXQTDIR)$(SYSCONFDIR)
	install $(FMODE) $(LXQT_DM) $(DESTDIR)$(LXQTDIR)$(SYSCONFDIR)

uninstall-base:
	for f in $(notdir $(BASE)); do $(RM) $(DESTDIR)$(BASEDIR)/$$f; done
	for f in $(notdir $(LIVE)); do $(RM) $(DESTDIR)$(OVERLAYDIR)/$$f; done
	for f in $(notdir $(LIVE_DEFAULT)); do $(RM) $(DESTDIR)$(OVERLAYDIR)/default/$$f; done
	for f in $(notdir $(LIVE_PAM)); do $(RM) $(DESTDIR)$(OVERLAYDIR)/pam.d/$$f; done
	for f in $(notdir $(LIVE_SUDOERS)); do $(RM) $(DESTDIR)$(OVERLAYDIR)/sudoers.d/$$f; done
	$(RMD) $(DESTDIR)$(BASEDIR)

uninstall-lxqt:
	for f in $(notdir $(LXQT)); do $(RM) $(DESTDIR)$(LXQTDIR)/$$f; done
	for f in $(notdir $(LXQT_DM)); do $(RM) $(DESTDIR)$(LXQTDIR)$(SYSCONFDIR)/$$f; done
	$(RMD) $(DESTDIR)$(LXQTDIR)

install: install-lxqt install-base

uninstall: uninstall-lxqt uninstall-base

dist:
	git archive --format=tar --prefix=$(PKG)-$(VERSION)/ $(VERSION) | gzip -9 > $(PKG)-$(VERSION).tar.gz
	gpg --detach-sign --use-agent $(PKG)-$(VERSION).tar.gz

.PHONY: install uninstall dist install-lxqt install-base uninstall-lxqt uninstall-base

