# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="23.1"

inherit elisp git-r3

DESCRIPTION="Major mode for editing web templates"
HOMEPAGE="https://web-mode.org"

EGIT_REPO_URI="https://github.com/fxbois/web-mode.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.md"

src_test() {
	${EMACS} -batch -no-site-file -Q \
			 --eval '(setq standard-indent 2)' \
			 --eval '(setq-default indent-tabs-mode nil)' \
			 --eval '(load-file "web-mode.el")' \
			 --eval '(web-mode)' \
			 -l "${FILESDIR}/gentoo-${PN}-test.el" \
			 -f web-mode-test -f gentoo--web-mode-test-wrap-up \
		|| die "web-mode tests failed."
}
