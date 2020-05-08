# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs shell script related helper functions and macros"
HOMEPAGE="https://gitlab.com/akater/akater-sh-tools"

EGIT_REPO_URI="https://gitlab.com/akater/akater-sh-tools.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND="
	app-emacs/akater-misc-elisp
	app-emacs/dash
"

RDEPEND="${BDEPEND}
"

src_compile() {

	cd elisp
	elisp-compile *.el || die "Compiling *.el failed"

}

src_install() {

	cd elisp
	elisp-install ${PN} *.{el,elc} || die "Cannot install elisp files"

}
