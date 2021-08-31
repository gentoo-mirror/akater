# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Emacs Lisp interface to the PostgreSQL RDBMS"
HOMEPAGE="https://github.com/cbbrowne/pg.el"

EGIT_REPO_URI="https://github.com/cbbrowne/pg.el.git"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
