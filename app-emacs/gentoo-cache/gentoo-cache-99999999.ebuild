# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Elisp package that provides cached data about underlying Gentoo system to Emacs"
HOMEPAGE="https://gitlab.com/akater/emacs-gentoo-cache"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-gentoo-cache.git"
EGIT_BRANCH="release"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.org"

BDEPEND=">=app-editors/emacs-25
	app-emacs/akater-misc
	app-emacs/anaphora"
RDEPEND=">=app-editors/emacs-25
	app-emacs/akater-misc
	app-emacs/akater-sh
	app-portage/eix
"
