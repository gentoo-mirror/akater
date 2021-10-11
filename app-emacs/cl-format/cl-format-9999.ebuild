# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

MY_PN="elisp-${PN}"
inherit elisp git-r3

DESCRIPTION="CL format routine"
HOMEPAGE="https://gitlab.com/akater/elisp-cl-format"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
EGIT_BRANCH="release"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

src_prepare() {
	rm cl-format-pkg.el
	default
}

src_test() {
	emacs -Q -L . --batch -l ert -l cl-format.ert \
		  -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}
