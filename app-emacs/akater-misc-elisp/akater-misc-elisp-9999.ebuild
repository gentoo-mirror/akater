# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs Lisp accessory functions used by akater"
HOMEPAGE="https://gitlab.com/akater/akater-misc-elisp"

EGIT_REPO_URI="https://gitlab.com/akater/akater-misc-elisp.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	>=virtual/emacs-26
"

BDEPEND="${RDEPEND}
	app-emacs/dash
	app-emacs/anaphora
"

src_compile() {

	cd elisp
	elisp-compile *.el || die "Compiling *.el failed"

}

src_install() {

	cd elisp
	elisp-install ${PN} *.{el,elc} || die "Cannot install elisp files"

}
