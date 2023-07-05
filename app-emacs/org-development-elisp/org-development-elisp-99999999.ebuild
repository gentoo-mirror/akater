# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp-common akater-live-release

DESCRIPTION="Elisp package that streamlines development of Elisp packages in Org"
HOMEPAGE="https://gitlab.com/akater/org-development-elisp"

EGIT_REPO_URI="https://gitlab.com/akater/org-development-elisp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

RDEPEND="
	app-emacs/org-development
	app-emacs/org-src-elisp-extras
"

BDEPEND="${RDEPEND}
	app-emacs/mmxx-macros
	app-emacs/etemplate
"

DEPEND="test? ( app-emacs/ort )"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
