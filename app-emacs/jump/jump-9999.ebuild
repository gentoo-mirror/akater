# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

MY_PN="${PN}.el"
inherit elisp git-r3

DESCRIPTION="Build functions which contextually jump between files"
HOMEPAGE="https://github.com/eschulte/jump.el"

EGIT_REPO_URI="https://github.com/eschulte/${MY_PN}.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

BDEPEND="
	>=app-emacs/findr-0.7"
RDEPEND="
	>=app-emacs/findr-0.7
	>=app-emacs/inflections-2.4
"
