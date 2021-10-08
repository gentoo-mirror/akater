# Copyright 1999-2021 Gentoo Authors
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

DOCS="readme.md"
SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
	>=app-emacs/epc-0.1.1
"
# Also rdepend: `RPC::EPC::Service', DBI and Database drivers with CPAN.
# But I'm not yet aqcuainted with CPAN packaging

S="${WORKDIR}/${MY_P}"

src_prepare() {
	elisp_src_prepare

	ewarn "Perl support will not be installed.  No time for packaging, sorry."
	rm e2wm-edbi.el

	default
}

src_compile() {
	mv edbi-pkg.el edbi-pkg
	elisp_src_compile
	mv edbi-pkg edbi-pkg.el
}

src_install() {
	elisp_src_install
	# I don't know anything about Perl installs:
	# insinto /usr/lib/perl5
	# doins edbi-bridge.pl
}
