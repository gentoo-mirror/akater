# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Database independent interface for Emacs"
HOMEPAGE="https://github.com/kiwanami/emacs-edbi"

# EGIT_REPO_URI="https://github.com/kiwanami/emacs-edbi.git"
EGIT_REPO_URI="https://github.com/akater/emacs-edbi.git"
# EGIT_BRANCH="master"
EGIT_BRANCH="lexical-binding-and-style"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="examples mysql postgres sqlite"

REQUIRED_USE="|| ( mysql postgres sqlite )"

DOCS="readme.md"
SITEFILE="50${PN}-gentoo.el"

BDEPEND="app-emacs/auto-complete"
RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
	>=app-emacs/epc-0.1.1
	app-emacs/e2wm
	dev-perl/DBI
	sqlite? ( dev-perl/DBD-SQLite )
	postgres? ( dev-perl/DBD-Pg )
	mysql? ( dev-perl/DBD-mysql )
	>=dev-perl/RPC-EPC-Service-0.0.11
"

src_compile() {
	mv edbi-pkg.el edbi-pkg
	elisp_src_compile
	mv edbi-pkg edbi-pkg.el
}

src_install() {
	elisp_src_install
	elisp-install ${PN} edbi-bridge.pl
	if use examples ; then
		insinto ${SITEETC}/${PN}/examples
		doins examples/api.pl
	fi
	# I don't know anything about Perl installs
	# but we need to place this to load-path, according to readme,
	# so it's not
	# insinto /usr/lib/perl5
	# doins edbi-bridge.pl
}
