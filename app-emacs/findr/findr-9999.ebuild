# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Breadth-first file-finding facility for (X)Emacs"
HOMEPAGE="https://emacswiki.org/emacs/findr.el"

EGIT_REPO_URI="https://github.com/emacsorphanage/findr.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
