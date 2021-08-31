# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

inherit elisp git-r3

DESCRIPTION="Interactive macro expander"
HOMEPAGE="https://github.com/joddie/macrostep"

EGIT_REPO_URI="https://github.com/joddie/macrostep.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 x86"

LICENSE="GPL-3+"
SLOT="0"
