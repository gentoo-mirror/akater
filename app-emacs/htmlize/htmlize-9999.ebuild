# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3

MY_PN="emacs-${PN}"
DESCRIPTION="HTML-ize font-lock buffers in Emacs"
HOMEPAGE="https://www.emacswiki.org/emacs/Htmlize
	https://github.com/hniksic/emacs-htmlize"
EGIT_REPO_URI="https://github.com/hniksic/${MY_PN}.git"
EGIT_BRANCH="master"
# EGIT_REPO_URI="https://github.com/akater/${MY_PN}.git"
# EGIT_BRANCH="css-variable-colours"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~x86"

# S="${WORKDIR}/${MY_PN}"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.md NEWS"
