# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp git-r3

DESCRIPTION="Make M-. and M-, work in elisp like they do in slime"
HOMEPAGE="https://github.com/purcell/elisp-slime-nav"

EGIT_REPO_URI="https://github.com/purcell/elisp-slime-nav.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.md"
