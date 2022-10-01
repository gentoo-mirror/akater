# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp orgmode akater-live-release

DESCRIPTION="Elisp package that streamlines development of Elisp packages in org"
HOMEPAGE="https://gitlab.com/akater/org-development-elisp"

EGIT_REPO_URI="https://gitlab.com/akater/org-development-elisp.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	app-emacs/org-development
	app-emacs/org-project
"

BDEPEND="${RDEPEND}
	app-emacs/mmxx-macros
"

src_install() {

	elisp-install ${PN} build/*.{el,elc}

	elisp-install ${PN} -r templates

	elisp-install ${PN} -r testing

}
