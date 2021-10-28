# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Library for working with xml via esxml and sxml"
HOMEPAGE="https://github.com/tali713/esxml"

EGIT_REPO_URI="https://github.com/tali713/esxml.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/kv-0.0.5
"

SITEFILE="50esxml-gentoo.el"
