# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp git-r3

DESCRIPTION="StackExchange client for Emacs"
HOMEPAGE="https://github.com/vermiculus/sx.el/"

EGIT_REPO_URI="https://github.com/vermiculus/sx.el.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/markdown-mode-2.0
"
