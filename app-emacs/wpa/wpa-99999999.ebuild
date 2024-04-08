# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

MY_PN="emacs-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Emacs interface to wpa_supplicant"
HOMEPAGE="https://gitlab.com/akater/emacs-wpa"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="debug test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	net-wireless/wpa_supplicant
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"
RDEPEND="
	net-wireless/wpa_supplicant
	app-emacs/akater-misc
	app-emacs/shmu
	sys-apps/coreutils
"

DEPEND="test? ( app-emacs/ort )"

SITEFILE="50${PN}-gentoo.el"
