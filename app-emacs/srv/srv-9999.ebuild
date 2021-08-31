# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="perform SRV DNS requests"
HOMEPAGE="https://github.com/legoscia/srv.el"

EGIT_REPO_URI="https://github.com/legoscia/srv.el.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
