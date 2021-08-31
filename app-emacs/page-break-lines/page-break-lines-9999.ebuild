# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="Display ^L page breaks as tidy horizontal lines"
HOMEPAGE="https://github.com/purcell/page-break-lines"

EGIT_REPO_URI="https://github.com/purcell/page-break-lines.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
