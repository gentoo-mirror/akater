# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Elisp package that allows convenient cycling of org src block headers"
HOMEPAGE="https://gitlab.com/akater/org-header-cycling"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	app-emacs/set-endos
"

BDEPEND="${RDEPEND}"
