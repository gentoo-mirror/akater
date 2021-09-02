# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Convenient infix arguments and suffix commands in Emacs"
HOMEPAGE="https://github.com/magit/transient"

EGIT_REPO_URI="https://github.com/akater/transient.git"
EGIT_BRANCH="emacs-28-eieio-compliance"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

S="${WORKDIR}/${P}/lisp"
ELISP_TEXINFO="../docs/transient.texi"
DOCS="../README.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	sys-apps/texinfo"
