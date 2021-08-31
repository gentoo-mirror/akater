# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Emacs library to convert strings into ansi"
HOMEPAGE="https://github.com/rejeep/ansi"

EGIT_REPO_URI="https://github.com/rejeep/ansi.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.markdown"

BDEPEND="
	>=app-emacs/s-1.6.1
	>=app-emacs/dash-1.5.0
"
