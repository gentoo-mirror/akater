# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

inherit elisp git-r3

DESCRIPTION="Run rake commands"
HOMEPAGE="https://github.com/asok/rake.el"

EGIT_REPO_URI="https://github.com/asok/rake.el.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/f-0.13.0
	>=app-emacs/dash-1.5.0
"
