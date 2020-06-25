# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs Lisp accessory functions used by akater"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-misc"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-akater-misc.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=virtual/emacs-26"
BDEPEND="${RDEPEND}
	app-emacs/anaphora
"
