# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

inherit elisp git-r3

DESCRIPTION="Growl-style notification system for Emacs"
HOMEPAGE="https://github.com/jwiegley/alert"

EGIT_REPO_URI="https://github.com/jwiegley/alert.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/gntp-0.1
	>=app-emacs/log4e-0.3.0
"

SITEFILE="50${PN}-gentoo.el"
