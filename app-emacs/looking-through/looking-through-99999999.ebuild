# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Emacs Lisp's looking-at, followed by movement if match succeeded"
HOMEPAGE="https://gitlab.com/akater/elisp-looking-through"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

DOCS="" # README.org is a relative symlink

IUSE="test"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"

RDEPEND="
	app-emacs/akater-misc
"

DEPEND="test? ( app-emacs/akater-misc )"
