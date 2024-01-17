# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27.1"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="TOTP in Emacs"
HOMEPAGE="https://framagit.org/akater/emacs-totp"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/base32"
RDEPEND="${BDEPEND}
	app-editors/emacs[gmp,ssl]
	app-admin/pass[emacs]
"

DEPEND="test? ( app-emacs/ort )"

pkg_postinst() {
	if ! has_version "net-misc/ntp"; then
		elog
		elog "Consider installing an NTP client."
		elog "If your system time is off, your TOTP PINs won't work."
		elog
	fi
}
