# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26.1"

inherit elisp git-r3

DESCRIPTION="Highly accessible themes (WCAG AAA) for Emacs"
HOMEPAGE="https://gitlab.com/protesilaos/modus-themes/"

EGIT_REPO_URI="https://gitlab.com/protesilaos/modus-themes.git"
EGIT_BRANCH="main"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS="README.md"

BDEPEND="
		doc? ( sys-apps/texinfo
			   || ( app-emacs/org-mode
					app-emacs/org
					app-editors/emacs[-minimal] ) ) "

src_prepare() {

	default

	if use doc ; then
		$EMACS -batch \
			   --eval "(require 'ox-texinfo)" \
			   -f org-texinfo-export-to-texinfo-batch \
			   doc/"${PN}".org doc/"${PN}".texi
		ELISP_TEXINFO="doc/${PN}.texi"
	fi

}
