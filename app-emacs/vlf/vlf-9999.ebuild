# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="View Large Files"
HOMEPAGE="https://github.com/m00natic/vlfi"

EGIT_REPO_URI="https://github.com/m00natic/vlfi.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {

	eapply "${FILESDIR}/${PN}"-replace-obsolete-name.patch

	default
}
