# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp orgmode git-r3

DESCRIPTION="Support for links to CLHS in Org mode"
HOMEPAGE="https://gitlab.com/akater/org-clhs"

EGIT_REPO_URI="https://gitlab.com/akater/org-clhs.git"
# EGIT_REPO_URI="file:///usr/local/src/org-clhs"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
IUSE="examples"

RDEPEND="
	>=virtual/emacs-26
	dev-lisp/hyperspec
	app-emacs/slime
	examples? ( app-emacs/elisp-slime-nav )
"

BDEPEND="${RDEPEND}"

src_compile() {

	cd elisp
	elisp-compile *.el || die "Compiling *.el failed"

	# when use examples
	cd ..
	cd examples
	elisp-compile *.el || die "Compiling *.el failed"

}

src_install() {

	cd elisp
	elisp-install ${PN} *.{el,elc} || die "Cannot install elisp files"

	# when use examples
	elisp-install-r ${PN} examples || die "Cannot install examples"

}
