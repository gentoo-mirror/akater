# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Simple outline library."
HOMEPAGE="https://github.com/abo-abo/zoutline"

EGIT_REPO_URI="https://github.com/abo-abo/zoutline.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
