# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Functions to deal with ebuilds in Emacs Lisp"
HOMEPAGE="https://gitlab.com/akater/emacs-gentoo-cache"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-gentoo-cache.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

BDEPEND=">=virtual/emacs-25
	app-emacs/anaphora"
RDEPEND=">=virtual/emacs-25
	app-emacs/akater-misc
	app-emacs/akater-sh-tools
	app-portage/eix
"
