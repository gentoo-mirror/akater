# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

ELPA_CONTAINER_KIND=tar

inherit readme.gentoo-r1 elpa

DESCRIPTION="Undo trees and visualization"
HOMEPAGE="http://www.dr-qubit.org/undo-tree.html"

SLOT="0"
KEYWORDS="amd64 x86"

SITEFILE="50${PN}-gentoo.el"
DOC_CONTENTS="To enable undo trees globally, place '(global-undo-tree-mode)'
	in your init file."

DEPEND="app-emacs/queue"
RDEPEND="${DEPEND}"
