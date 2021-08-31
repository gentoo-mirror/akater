# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Manage /usr/bin/lisp symlink"
HOMEPAGE="https://www.gentoo.org/proj/en/eselect/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=app-eselect/eselect-lib-bin-symlink-0.1.1"

# RDEPEND=">=app-eselect/eselect-lib-bin-symlink-0.1.1
# 	|| ( dev-lisp/clisp dev-lisp/sbcl )"

# PDEPEND="|| ( dev-lisp/clisp dev-lisp/sbcl[-bootstrap] )"
# We need to make sure eselect-lisp can nevertheless be installed with sbcl[bootstrap]

S="${FILESDIR}"

src_install() {
	default
	insinto /usr/share/eselect/modules
	newins lisp.eselect-${PV} lisp.eselect
}

# pkg_postinst() {
# 	eselect lisp update --if-unset || die "You need at least one lisp"
# }
