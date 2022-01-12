# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Visual popup interface library for Emacs"
HOMEPAGE="https://github.com/auto-complete/popup-el"
EGIT_REPO_URI="https://github.com/auto-complete/popup-el.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="test"

DOCS="README.md"
