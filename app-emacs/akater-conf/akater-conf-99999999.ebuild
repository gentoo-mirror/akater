# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp orgmode git-r3

DESCRIPTION="Emacs Lisp conf-related functions and macros used by akater"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-conf"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-akater-conf.git"
# EGIT_REPO_URI="file:///tmp/elisp-akater-conf/"
EGIT_BRANCH="master"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

RDEPEND="
	app-emacs/akater-misc"
BDEPEND="${RDEPEND}
	app-emacs/anaphora
"

DEPEND="test? ( app-emacs/akater-misc
				app-emacs/org-development-elisp )"

SITEFILE="50{PN}-gentoo.el"

src_prepare() {
	use test || rm ${PN}-tests.org

	eapply_user
}

# src_compile() {
# 	:;
# }

# src_install() {
# 	elisp-install ${PN} build/*.el || die "Cannot install elisp files"
# }
