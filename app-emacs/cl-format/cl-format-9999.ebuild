# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24

inherit elisp git-r3

DESCRIPTION="CL format routine"
HOMEPAGE="https://github.com/alvinfrancis/cl-format"

EGIT_REPO_URI="https://github.com/alvinfrancis/${PN}.git"
EGIT_BRANCH="master"
# EGIT_REPO_URI="https://gitlab.com/akater/elisp-${PN}.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

src_prepare() {
	rm cl-format-pkg.el
	default
}

src_test() {
	emacs -Q -L . --batch -l ert -l cl-format.ert
}
