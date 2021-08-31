# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Contact management package"
HOMEPAGE="https://github.com/girzel/ebdb"

EGIT_REPO_URI="https://github.com/girzel/ebdb.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"
IUSE="company"

LICENSE="GPL-3"
SLOT="0"

ELISP_TEXINFO="ebdb.texi"
DOCS="README.org"

BDEPEND="
	sys-apps/texinfo"
RDEPEND="
	company? ( app-emacs/company-ebdb )"

src_prepare() {
	default
	rm ebdb-mhe.el
}
