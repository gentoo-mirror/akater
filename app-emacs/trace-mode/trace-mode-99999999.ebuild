# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp orgmode git-r3

DESCRIPTION="Attempt at mode for trace output and one extra feature for trace"
HOMEPAGE="https://gitlab.com/akater/elisp-trace-mode"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-trace-mode.git"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

# DOCS="README.org"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"
RDEPEND="
	app-emacs/akater-misc"
