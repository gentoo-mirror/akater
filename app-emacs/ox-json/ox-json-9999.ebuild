# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="JSON export backend for Org mode"
HOMEPAGE="https://github.com/jlumpe/ox-json"

EGIT_REPO_URI="https://github.com/jlumpe/ox-json.git"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS=( "README.md" "ox-json-docs.org" )

RDEPEND="
>=app-emacs/s-1.12
"
