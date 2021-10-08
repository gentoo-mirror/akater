# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Test coverage library for Emacs Lisp"
HOMEPAGE="https://github.com/sviridov/undercover.el"

EGIT_REPO_URI="https://github.com/undercover-el/undercover.el.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/dash-2.0.0
	>=app-emacs/shut-up-0.3.2
"
