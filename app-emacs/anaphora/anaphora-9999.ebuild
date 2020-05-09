# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Anaphoric macros for Emacs Lisp providing implicit temp variables"
HOMEPAGE="https://github.com/rolandwalker/anaphora"

EGIT_REPO_URI="https://github.com/rolandwalker/anaphora.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="public-domain"
SLOT="0"
IUSE=""

RDEPEND="
	virtual/emacs
"

BDEPEND="${RDEPEND}"

src_compile() {

	elisp-compile *.el || die "Compiling *.el failed"

}

src_install() {

	elisp-install ${PN} *.{el,elc} || die "Cannot install elisp files"

}
