# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

MY_PN="emacs-wpa"
inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs interface to wpa_supplicant"
HOMEPAGE="https://gitlab.com/akater/emacs-wpa"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
EGIT_BRANCH="release"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DOCS="README.org"

BDEPEND="
	net-wireless/wpa_supplicant
	app-emacs/anaphora
	app-emacs/akater-misc
"
RDEPEND="
	net-wireless/wpa_supplicant
	app-emacs/akater-misc
	app-emacs/akater-sh
"

SITEFILE="50${PN}-gentoo.el"
