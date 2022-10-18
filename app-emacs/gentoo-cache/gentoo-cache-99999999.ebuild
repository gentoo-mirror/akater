# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"
MY_PN="emacs-${PN}"

inherit elisp orgmode akater-live-release

DESCRIPTION="Elisp package that provides cached data about underlying Gentoo system to Emacs"
HOMEPAGE="https://gitlab.com/akater/emacs-gentoo-cache"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="" # README.org is a relative symlink

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"
RDEPEND="
	app-emacs/akater-misc
	app-emacs/akater-sh
	app-portage/eix
"
