# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=26
# maybe 25 will do but Lars doesn't think so

inherit elisp git-r3

DESCRIPTION="An ORM for Emacs sqlite3"
HOMEPAGE="https://github.com/larsmagne/sqorm.el"

EGIT_REPO_URI="https://github.com/larsmagne/sqorm.el.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND=">=app-editors/emacs-26[dynamic-loading]
	app-emacs/sqlite3"
RDEPEND=">=app-editors/emacs-26[dynamic-loading]
	app-emacs/sqlite3"
