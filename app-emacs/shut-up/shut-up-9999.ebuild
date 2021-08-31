# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Shut up would you!"
HOMEPAGE="https://github.com/rejeep/shut-up.el"

EGIT_REPO_URI="https://github.com/cask/shut-up.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"
