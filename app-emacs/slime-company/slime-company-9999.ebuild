# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="slime completion backend for company mode"
HOMEPAGE="https://github.com/anwyn/slime-company"

EGIT_REPO_URI="https://github.com/anwyn/slime-company.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"

DOCS="README.md"

BDEPEND="
	>=app-emacs/slime-2.13"
RDEPEND="${BDEPEND}
	>=app-emacs/company-0.9.0"

src_install() {

	elisp-install slime/contrib/ *.{el,elc}

	dodoc README.md

}
