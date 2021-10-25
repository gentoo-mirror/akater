# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="A color coded smart mode-line."
HOMEPAGE="https://github.com/Malabarba/smart-mode-line"

EGIT_REPO_URI="https://github.com/Malabarba/smart-mode-line.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/rich-minority-0.1.1
"
