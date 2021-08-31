# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Support for Org links to Magit buffers"
HOMEPAGE="https://github.com/magit/orgit"

EGIT_REPO_URI="https://github.com/magit/orgit.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/magit-2.90.1
	>=app-emacs/org-9.3
"
