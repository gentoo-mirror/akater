# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="Use the Emacsclient as the \$EDITOR of child processes"
HOMEPAGE="https://magit.vc/manual/with-editor"

EGIT_REPO_URI="https://github.com/magit/with-editor.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${P}/lisp"
SITEFILE="50${PN}-gentoo.el"
ELISP_TEXINFO="../docs/*.texi"
DOCS="../README.org ../docs/with-editor.org"

BDEPEND="
	sys-apps/texinfo
"
RDEPEND="
	>=app-emacs/async-1.9
"
