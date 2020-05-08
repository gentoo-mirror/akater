# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit elisp git-r3

DESCRIPTION="Simple asynchronous functions for Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-deferred"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-deferred.git"
KEYWORDS="amd64 x86"

LICENSE=GPL-3
SLOT=0

BDEPEND=">=virtual/emacs-24.4"
RDEPEND=">=virtual/emacs-24.4"

src_compile() {
	elisp-compile *.el || \
		die "Could not compile"
}
