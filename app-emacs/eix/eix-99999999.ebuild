# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs Lisp interface to app-portage/eix"
HOMEPAGE="https://gitlab.com/akater/elisp-eix"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-eix.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DOCS="README.org"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/akater-sh
"
RDEPEND="${BDEPEND}
	>=app-portage/eix-0.34.4
"
