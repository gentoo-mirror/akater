# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Database independent interface for Emacs"
HOMEPAGE="https://github.com/kiwanami/emacs-edbi"

EGIT_REPO_URI="https://github.com/kiwanami/emacs-edbi.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
	>=app-emacs/epc-0.1.1
"

src_prepare() {
	elisp_src_prepare

	rm e2wm-edbi.el

	default
}

src_compile() {
	mv edbi-pkg.el edbi-pkg
	elisp_src_compile
	mv edbi-pkg edbi-pkg.el
}
