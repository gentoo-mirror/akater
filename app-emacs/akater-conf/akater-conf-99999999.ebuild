# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp-common akater-live-release

DESCRIPTION="Emacs Lisp conf-related functions and macros used by akater"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-conf"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-akater-conf.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"
RDEPEND="
	app-emacs/akater-misc
"

DEPEND="test? ( app-emacs/akater-misc
				app-emacs/org-development-elisp )"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	use test || rm ${PN}-tests.org

	eapply_user
}
