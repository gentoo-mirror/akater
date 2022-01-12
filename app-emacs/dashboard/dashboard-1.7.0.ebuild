# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.3"

inherit elisp

MY_P="emacs-${P}"
DESCRIPTION="A startup screen extracted from Spacemacs"
HOMEPAGE="https://github.com/emacs-dashboard/emacs-dashboard"

SRC_URI="https://github.com/emacs-dashboard/emacs-dashboard/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
S="${WORKDIR}/${MY_P}"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	>=app-emacs/page-break-lines-0.11
"

RDEPEND="
	>=app-emacs/page-break-lines-0.11
"
