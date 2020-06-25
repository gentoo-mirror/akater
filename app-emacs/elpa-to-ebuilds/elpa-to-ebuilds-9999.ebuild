# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Convert loaded Elisp packages to ebuilds"
HOMEPAGE="https://gitlab.com/akater/elpa-to-ebuilds"

EGIT_REPO_URI="https://gitlab.com/akater/elpa-to-ebuilds.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DOCS="README.org"

BDEPEND=">=virtual/emacs-26
	app-emacs/anaphora
	app-emacs/akater-misc
"

RDEPEND=">=virtual/emacs-26
	app-emacs/epl
	app-emacs/ebuild-mode
	app-emacs/akater-misc
	app-emacs/akater-sh-tools
	app-emacs/ebuild-tools
"
