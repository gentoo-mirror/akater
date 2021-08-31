# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Store EIEIO objects using EmacSQL"
HOMEPAGE="https://github.com/emacscollective/closql"

EGIT_REPO_URI="https://github.com/emacscollective/closql.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
>=app-emacs/emacsql-3.0.0
"
