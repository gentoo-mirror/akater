# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="A RPC stack for the Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-epc"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-epc.git"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
"
