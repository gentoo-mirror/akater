# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Allow rsync from dired buffers"
HOMEPAGE="https://github.com/stsquad/dired-rsync"

EGIT_REPO_URI="https://github.com/stsquad/dired-rsync.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.org"

RDEPEND="
	>=app-emacs/s-1.12.0
	>=app-emacs/dash-2.0.0
	net-misc/rsync
"

src_prepare() {
	use test || rm dired-rsync-ert.el

	default
}
