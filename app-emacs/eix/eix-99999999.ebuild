# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs Lisp interface to app-portage/eix"
HOMEPAGE="https://gitlab.com/akater/elisp-eix"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-eix.git"
EGIT_BRANCH="release"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DOCS="README.org"

BDEPEND=">=app-editors/emacs-24
	app-emacs/akater-misc
	app-emacs/akater-sh
"
RDEPEND="${BDEPEND}
	>=app-portage/eix-0.34.4
"
