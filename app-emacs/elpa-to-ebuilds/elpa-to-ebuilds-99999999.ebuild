# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="${PN}"
inherit elisp-common akater-live-release akater-emacs-nojit

DESCRIPTION="Convert Elisp packages to ebuilds"
HOMEPAGE="https://gitlab.com/akater/elpa-to-ebuilds"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="melpa"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/looking-through
	app-emacs/mmxx-macros
"

RDEPEND="
	app-emacs/akater-misc
	app-emacs/akater-sh
	app-emacs/ebuild-mode
	app-emacs/ebuild-tools
	app-emacs/file-tree
	melpa? ( app-emacs/melpa-sources[package-build,recipes] )
"
