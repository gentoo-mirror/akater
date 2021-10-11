# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3

DESCRIPTION="A modern list library for Emacs"
HOMEPAGE="https://github.com/magnars/dash.el"

EGIT_REPO_URI="https://github.com/magnars/dash.el.git"
EGIT_BRANCH="master"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86 ~amd64-linux ~x86-linux"

BDEPEND="sys-apps/texinfo"

SITEFILE="50${PN}-gentoo.el"
ELISP_TEXINFO="dash.texi"
DOCS="README.md"
