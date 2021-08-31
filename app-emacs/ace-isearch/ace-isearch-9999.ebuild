# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="A seamless bridge between isearch, ace-jump-mode, avy, helm-swoop and swiper"
HOMEPAGE="https://github.com/tam17aki/ace-isearch"

EGIT_REPO_URI="https://github.com/tam17aki/ace-isearch.git"
EGIT_BRANCH="master"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
