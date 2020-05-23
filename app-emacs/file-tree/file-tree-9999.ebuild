# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Manipulation of symbolic file trees in Elisp"
HOMEPAGE="https://gitlab.com/akater/elisp-file-tree"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-file-tree.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND=">=virtual/emacs-26
	app-emacs/anaphora
	app-emacs/akater-misc-elisp
"

RDEPEND="${BDEPEND}
"
