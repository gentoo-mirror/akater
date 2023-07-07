# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Emacs interface to Portage"
HOMEPAGE="https://gitlab.com/akater/emacs-portage"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="helm pona smart-live-rebuild test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/shmu
	app-emacs/ebuild-tools
	app-emacs/gentoo-cache
	app-emacs/mmxx-macros
	helm? ( app-emacs/helm )
	pona? ( app-emacs/portage-navi )
	app-emacs/transient
"

RDEPEND="
	app-portage/eix
	app-portage/gentoolkit
	smart-live-rebuild? ( app-portage/smart-live-rebuild )
	app-emacs/akater-misc
	app-emacs/shmu[privileged]
	app-emacs/ebuild-tools
	app-emacs/gentoo-cache
	helm? ( app-emacs/helm )
	pona? ( app-emacs/deferred app-emacs/portage-navi )
	app-emacs/transient
	>=sys-apps/portage-2.3.7
"

DEPEND="test? ( app-emacs/ort app-emacs/org-src-elisp-extras )"

SITEFILE="70emacs-${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
