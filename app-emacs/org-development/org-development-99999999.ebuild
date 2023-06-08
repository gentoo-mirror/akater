# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="${PN}"
inherit elisp orgmode git-r3

DESCRIPTION="Elisp package that streamlines software development in org"
HOMEPAGE="https://gitlab.com/akater/org-development"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.org"

RDEPEND="
	app-emacs/org-header-cycling
	app-emacs/org-project
	>=app-emacs/poly-org-0.2
"

BDEPEND="${RDEPEND}
	app-emacs/akater-misc
	app-emacs/mmxx-macros
	app-emacs/looking-through
	app-emacs/set-endos
"

DEPEND="test? ( app-emacs/akater-misc
				app-emacs/org-development-elisp )"
