# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=24.4

inherit elisp git-r3

DESCRIPTION="X protocol Emacs Lisp Binding"
HOMEPAGE="https://github.com/emacs-exwm/xelb/"
EGIT_REPO_URI="https://github.com/emacs-exwm/${PN}.git"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	app-editors/emacs[gui]
	x11-apps/xauth
"

DOCS=( README.md )
SITEFILE="50${PN}-gentoo.el"
