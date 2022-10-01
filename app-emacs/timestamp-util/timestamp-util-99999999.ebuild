# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27"

MY_PN="elisp-${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Define Elisp timestamp matchers"
HOMEPAGE="https://gitlab.com/akater/elisp-timestamp-util"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

DOCS="README.org"

BDEPEND="
	app-emacs/akater-misc
	app-emacs/looking-through
	app-emacs/mmxx-macros
"

RDEPEND="
	app-emacs/akater-misc
"
