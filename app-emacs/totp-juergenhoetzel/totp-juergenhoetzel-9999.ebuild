# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27.1"

inherit elisp git-r3

DESCRIPTION="Time-based One-time Password (TOTP)"
HOMEPAGE="https://github.com/juergenhoetzel/emacs-totp"

EGIT_REPO_URI="https://github.com/juergenhoetzel/emacs-totp.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.org"

BDEPEND="test? ( app-emacs/buttercup )"

src_compile() {
	if ! use test ; then
		rm "${PN}-test.el"
	fi
	elisp_src_compile
}

src_test() {
	${EMACS} -batch -Q -L "${SITELISP}/buttercup" -L . \
			 -l "${PN}-test.elc" \
			 -f buttercup-run || die "Buttercup test(s) failed."
}
