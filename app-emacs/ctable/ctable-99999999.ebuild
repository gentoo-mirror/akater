# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Table component for Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-ctable"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-ctable.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
DOCS="readme.md"

src_prepare() {
	rm test-ctable.el
	default
}
