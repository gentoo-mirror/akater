# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Manipulating symbolic file trees in Elisp"
HOMEPAGE="https://gitlab.com/akater/elisp-file-tree"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/mmxx-macros
	test? ( app-emacs/org-development-elisp
			app-emacs/akater-sh )
"

RDEPEND="${BDEPEND}
	app-emacs/akater-sh
"

SITEFILE="50${PN}-gentoo.el"
