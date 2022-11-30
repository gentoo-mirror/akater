# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24

inherit elisp git-r3

DESCRIPTION="Window layout manager"
HOMEPAGE="https://github.com/kiwanami/emacs-window-layout"

# EGIT_REPO_URI="https://github.com/kiwanami/emacs-window-layout.git"
EGIT_REPO_URI="https://github.com/akater/emacs-window-layout.git"
EGIT_BRANCH="lexical-binding-and-style"

KEYWORDS="~amd64 x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="readme.md"

SITEFILE="50window-layout-gentoo.el"
