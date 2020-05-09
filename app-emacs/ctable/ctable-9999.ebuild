# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Table component for Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-ctable"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-ctable.git"
KEYWORDS="amd64 x86"

LICENSE=GPL-3
SLOT=0

DOCS="readme.md"

BDEPEND=">=virtual/emacs-24"
RDEPEND=">=virtual/emacs-24"

src_compile() {
	elisp-compile *.el || \
		die "Could not compile"
}
