# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="UUID's for EmacsLisp"
HOMEPAGE="https://github.com/nicferrier/emacs-uuid"

EGIT_REPO_URI="https://github.com/nicferrier/emacs-uuid.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS="README.creole"

SITEFILE="50${PN}-gentoo.el"
