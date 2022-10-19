# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"
MY_PN="elisp-${PN}"

inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs Lisp interface to app-portage/eix"
HOMEPAGE="https://gitlab.com/akater/elisp-eix"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/akater-sh
	app-emacs/mmxx-macros
"
RDEPEND="${BDEPEND}
	>=app-portage/eix-0.34.4
"

SITEFILE="50${PN}-gentoo.el"
