# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Breadth-first file-finding facility for (X)Emacs"
HOMEPAGE="https://emacswiki.org/emacs/findr.el"

EGIT_REPO_URI="https://github.com/emacsorphanage/findr.git"
EGIT_COMMIT="1ddbc0464bb05dcda392b62666ad17239a2152d3"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
