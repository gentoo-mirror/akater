# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

MY_PN="${PN}.el"
MY_P="${MY_PN}-${PV}"
inherit elisp

DESCRIPTION="Emacs Lisp Literate programming tool"
HOMEPAGE="https://github.com/zevlg/ellit-org.el"

SRC_URI="https://github.com/zevlg/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS="README.org"
IUSE="test"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	( || ( app-emacs/org app-emacs/org-mode app-editors/emacs[-minimal] ) )
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	if use test ; then
		sed -e "1i\(require 'ert)\n" -i test.el
	else
		rm test.el
	fi

	default
}

src_test() {
	# todo: emake test uses svg so such test fails with emacs[-gui]
	${EMACS} -q --batch -L . \
			 -l test -f ert-run-tests-batch-and-exit \
		&& rm test.el*
}
