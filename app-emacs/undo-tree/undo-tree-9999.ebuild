# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit readme.gentoo-r1 elisp git-r3

DESCRIPTION="Undo trees and visualization"
HOMEPAGE="http://www.dr-qubit.org/undo-tree.html"
EGIT_REPO_URI="https://www.dr-qubit.org/git/undo-tree.git"
EGIT_CLONE_TYPE="single+tags"
EGIT_BRANCH="master"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
DOC_CONTENTS="To enable undo trees globally, place '(global-undo-tree-mode)'
	in your .emacs file."
