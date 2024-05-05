# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27.1"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Change console resolution from Emacs"
HOMEPAGE="https://framagit.org/akater/emacs-fbset"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	|| ( >=app-editors/emacs-28 app-emacs/compat )
	app-emacs/mmxx-macros
	app-emacs/shmu
"
RDEPEND="
	|| ( >=app-editors/emacs-28 app-emacs/compat )
	app-emacs/shmu
	|| ( sys-apps/fbset sys-apps/busybox )
"

DEPEND="test? ( app-emacs/ort )"

src_compile() {
	elisp-check-emacs-version
	default
}
