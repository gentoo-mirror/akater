# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26.3"

inherit elisp git-r3

DESCRIPTION="An HTTP library that uses curl as a backend"
HOMEPAGE="https://github.com/alphapapa/plz.el"

EGIT_REPO_URI="https://github.com/alphapapa/plz.el.git"
EGIT_BRANCH="master"
# EGIT_REPO_URI="https://github.com/akater/plz.el.git"
# EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="net-misc/curl"

src_test() {
	emake test
}
