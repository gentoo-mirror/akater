# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Quickly switch windows."
HOMEPAGE="https://github.com/abo-abo/ace-window"

EGIT_REPO_URI="https://github.com/abo-abo/ace-window.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.md"

RDEPEND="
>=app-emacs/avy-0.5.0
"
