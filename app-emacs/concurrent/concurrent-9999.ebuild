# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit elisp git-r3

DESCRIPTION="Concurrent utility functions for Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-deferred/blob/master/README-concurrent.markdown"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-deferred.git"
KEYWORDS="amd64 x86"

LICENSE=GPL-3
SLOT=0

BDEPEND=">=virtual/emacs-24.3"
RDEPEND=">=virtual/emacs-24.3
	>=app-emacs/deferred-0.5.0
"

src_compile() {
	elisp-compile "*.el" || \
		die "Could not compile"
}
