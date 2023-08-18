# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

MY_PN="elisp-${PN}"
MY_P="${MY_PN}-${PV}"
inherit elisp

DESCRIPTION="CL format routine"
HOMEPAGE="https://gitlab.com/akater/elisp-cl-format"

SRC_URI="https://gitlab.com/akater/${MY_PN}/-/archive/${PV}/${MY_P}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	rm cl-format-pkg.el
	default
}

src_test() {
	emacs -Q -L . --batch -l ert -l cl-format.ert \
		  -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}
