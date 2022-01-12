# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.3"

inherit elisp git-r3

DESCRIPTION="A startup screen extracted from Spacemacs"
HOMEPAGE="https://github.com/emacs-dashboard/emacs-dashboard"

EGIT_REPO_URI="https://github.com/emacs-dashboard/emacs-dashboard.git"
EGIT_COMMIT="f7287f026103a44cf290fe737b6b9d841eddcaca"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	>=app-emacs/page-break-lines-0.11
"

RDEPEND="
	>=app-emacs/page-break-lines-0.11
"
