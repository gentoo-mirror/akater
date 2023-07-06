# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Emacs interface to mount via transient"
HOMEPAGE="https://gitlab.com/akater/emacs-transient-mount"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

KEYWORDS="amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

IUSE="test"

DOCS="" # README.org is a relative symlink

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/mmxx-macros
"
RDEPEND="
	>=sys-apps/util-linux-2.18
	app-emacs/transient
	app-emacs/akater-misc
	app-emacs/shmu[privileged]
"

DEPEND="test? ( app-emacs/ort )"

# todo: consider
# suid? ( util-linux/util-linux[suid] )
# !suid? ( app-emacs/shmu[privileged] )
# see euse -i suid
# in the util-linux section

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
