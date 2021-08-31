# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

MY_PN="emacs-${PN}"
inherit elisp git-r3

DESCRIPTION="Compatible layer for URL request in Emacs"
HOMEPAGE="https://github.com/tkf/emacs-request"

EGIT_REPO_URI="https://github.com/tkf/${MY_PN}.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/deferred-0.3.1
"
