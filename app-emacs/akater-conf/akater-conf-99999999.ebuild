# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs Lisp conf-related functions and macros used by akater"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-conf"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-akater-conf.git"
EGIT_BRANCH="release"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=app-editors/emacs-26
	app-emacs/akater-misc"
BDEPEND="${RDEPEND}
	app-emacs/anaphora
"

src_compile() {
	:;
}

src_install() {
	elisp-install ${PN} elisp/*.el || die "Cannot install elisp files"
}
