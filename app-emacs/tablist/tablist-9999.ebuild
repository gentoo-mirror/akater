# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Extended tabulated-list-mode"
HOMEPAGE="https://github.com/politza/tablist"

# EGIT_REPO_URI="https://github.com/politza/tablist.git"
EGIT_REPO_URI="https://github.com/akater/tablist.git"
# EGIT_BRANCH="master"
EGIT_BRANCH="fix-build"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
