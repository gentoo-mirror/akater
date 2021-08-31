# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="Paste to pastebin-like services"
HOMEPAGE="https://github.com/etu/webpaste.el"

EGIT_REPO_URI="https://github.com/etu/webpaste.el.git"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/request-0.2.0
"
