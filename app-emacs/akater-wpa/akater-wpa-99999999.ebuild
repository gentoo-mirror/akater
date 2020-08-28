# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs interface to wpa_supplicant"
HOMEPAGE="https://gitlab.com/akater/emacs-wpa"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-wpa.git"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DOCS="README.org"

BDEPEND=">=app-editors/emacs-25
	net-wireless/wpa_supplicant
	app-emacs/anaphora
	app-emacs/akater-misc"
RDEPEND=">=app-editors/emacs-25
	net-wireless/wpa_supplicant
	app-emacs/akater-misc
	app-emacs/akater-sh"
