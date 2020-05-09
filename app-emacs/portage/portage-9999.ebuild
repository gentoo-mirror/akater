# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs interface to Portage"
HOMEPAGE="https://gitlab.com/akater/emacs-portage"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-portage.git"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND=">=virtual/emacs-26"
RDEPEND=">=virtual/emacs-26
	app-portage/eix
	app-portage/gentoolkit
	app-emacs/portage-navi
	app-emacs/transient
	app-emacs/akater-misc-elisp
	app-emacs/akater-sh-tools
"

SITEFILE=70${PN}-sitefile.el
