# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_P="emacs-${P}"
inherit elisp

DESCRIPTION="Database independent interface for Emacs"
HOMEPAGE="https://github.com/kiwanami/emacs-edbi"

SRC_URI="https://github.com/akater/emacs-edbi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="mysql postgres sqlite"

DOCS="readme.md"
SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
	>=app-emacs/epc-0.1.1
	dev-perl/DBI
	sqlite? ( dev-perl/DBD-SQLite )
	postgres? ( dev-perl/DBD-Pg )
	mysql? ( dev-perl/DBD-mysql )
	>=dev-perl/RPC-EPC-Service-0.0.11
"

S="${WORKDIR}/${MY_P}"

src_compile() {
	mv edbi-pkg.el edbi-pkg
	elisp_src_compile
	mv edbi-pkg edbi-pkg.el
}

src_install() {
	elisp_src_install
	elisp-install ${PN} edbi-bridge.pl
	# I don't know anything about Perl installs
	# but we need to place this to load-path, according to readme,
	# so it's not
	# insinto /usr/lib/perl5
	# doins edbi-bridge.pl
}
