# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs shell script related helper functions and macros"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-sh"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

BDEPEND="
	app-emacs/akater-misc
"

RDEPEND="${BDEPEND}
"

DEPEND="test? ( app-emacs/ebuild-mode
				app-emacs/org-development-elisp )"

SITEFILE="50{PN}-gentoo.el"

src_prepare() {
	use test || rm ${PN}-tests.org

	eapply_user
}
