# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Convenient infix arguments and suffix commands in Emacs"
HOMEPAGE="https://github.com/magit/transient"

EGIT_REPO_URI="https://github.com/magit/transient.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 x86"

LICENSE=GPL-3
SLOT=0

S="${WORKDIR}/${P}/lisp"
ELISP_TEXINFO="../docs/transient.texi"
DOCS="../README.md"

BDEPEND=">=app-editors/emacs-25.1
	sys-apps/texinfo"

RDEPEND=">=app-editors/emacs-25.1"
