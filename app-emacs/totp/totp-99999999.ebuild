# Copyright 1999-2023 Gentoo Authors
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
RDEPEND="${BDEPEND}"

DEPEND="test? ( app-emacs/ort )"
