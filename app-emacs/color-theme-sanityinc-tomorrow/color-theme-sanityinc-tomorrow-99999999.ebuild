# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

inherit elisp git-r3

DESCRIPTION="A version of Chris Kempson's \"tomorrow\" themes"
HOMEPAGE="https://github.com/purcell/color-theme-sanityinc-tomorrow"

EGIT_REPO_URI="https://github.com/akater/color-theme-sanityinc-tomorrow.git"
EGIT_CLONE_TYPE="single"
EGIT_BRANCH="akater"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"

DOCS="README.markdown"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	|| ( >=app-editors/emacs-24 app-emacs/color-theme )
"
RDEPEND="${DBEPEND}"
