# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Major mode for Markdown-formatted text"
HOMEPAGE="https://jblevins.org/projects/markdown-mode/"

EGIT_REPO_URI="https://github.com/jrblevin/markdown-mode.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS=( "README.md" "CHANGES.md" )
