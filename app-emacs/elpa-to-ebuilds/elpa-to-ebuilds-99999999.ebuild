# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Convert Elisp packages to ebuilds"
HOMEPAGE="https://gitlab.com/akater/elpa-to-ebuilds"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="melpa test"

DOCS="" # README.org is a relative symlink

REQUIRED_USE="test? ( melpa )"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/looking-through
	app-emacs/mmxx-macros
"

RDEPEND="
	app-emacs/akater-misc
	app-emacs/shmu
	app-emacs/ebuild-mode
	app-emacs/ebuild-tools
	app-emacs/file-tree
	melpa? ( app-emacs/melpa-sources[package-build,recipes] )
"

DEPEND="
	test? ( app-emacs/ort )
"
