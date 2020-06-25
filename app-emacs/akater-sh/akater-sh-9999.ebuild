# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs shell script related helper functions and macros"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-sh"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-akater-sh.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND=">=virtual/emacs-26
	app-emacs/akater-misc
"

RDEPEND="${BDEPEND}
"
