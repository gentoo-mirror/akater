# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

inherit elisp git-r3

DESCRIPTION="Clean-up and Beautify the list of minor-modes."
HOMEPAGE="https://github.com/Malabarba/rich-minority"

EGIT_REPO_URI="https://github.com/Malabarba/rich-minority.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
