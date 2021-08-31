# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="A library for inserting Developer icons"
HOMEPAGE="https://github.com/domtronn/all-the-icons.el"

EGIT_REPO_URI="https://github.com/domtronn/all-the-icons.el.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

src_install() {
	elisp_src_install

	elisp-install ${PN} -r data
}
