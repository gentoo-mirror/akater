# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp git-r3

DESCRIPTION="State machine library"
HOMEPAGE="http://elpa.gnu.org/packages/fsm.html"

EGIT_REPO_URI="https://git.savannah.gnu.org/git/emacs/elpa.git"
EGIT_BRANCH="externals/${PN}"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
