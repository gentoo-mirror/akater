# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="The long lost Emacs string manipulation library."
HOMEPAGE="https://github.com/magnars/s.el"

EGIT_REPO_URI="https://github.com/magnars/s.el.git"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

LICENSE="GPL-3+"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
