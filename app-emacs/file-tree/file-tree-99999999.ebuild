# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Manipulating symbolic file trees in Elisp"
HOMEPAGE="https://gitlab.com/akater/elisp-file-tree"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/anaphora
	app-emacs/akater-misc
	app-emacs/dotree
"

RDEPEND="${BDEPEND}
"
