# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs Package Library"
HOMEPAGE="http://github.com/cask/epl"

EGIT_REPO_URI="http://github.com/cask/epl.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND=">=virtual/emacs-24"
RDEPEND=">=virtual/emacs-24"
