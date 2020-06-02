# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs interface to mount via transient"
HOMEPAGE="https://gitlab.com/akater/emacs-transient-mount"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-transient-mount.git"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND=">=virtual/emacs-26
	app-emacs/anaphora
"
RDEPEND=">=virtual/emacs-26
	>=sys-apps/util-linux-2.18
	app-emacs/transient
	app-emacs/akater-misc-elisp
	app-emacs/akater-sh-tools
"
