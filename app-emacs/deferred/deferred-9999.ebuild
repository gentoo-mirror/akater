# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="Simple asynchronous functions for Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-deferred"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-deferred.git"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
