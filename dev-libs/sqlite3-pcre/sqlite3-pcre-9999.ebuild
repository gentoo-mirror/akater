# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3

DESCRIPTION="REGEXP() for sqlite3"
HOMEPAGE="https://github.com/ralight/sqlite3-pcre"

EGIT_REPO_URI="https://github.com/ralight/sqlite3-pcre.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-libs/libpcre"

src_compile() {
	emake pcre.so
}
