# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Other echo area"
HOMEPAGE="https://github.com/abo-abo/hydra"

EGIT_REPO_URI="https://github.com/abo-abo/hydra.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	rm hydra*
	default
}
