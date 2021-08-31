# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp git-r3

DESCRIPTION="ergonomic modal keybinding minor mode."
HOMEPAGE="http://ergoemacs.org/misc/ergoemacs_vi_mode.html"

# EGIT_REPO_URI="https://github.com/xahlee/xah-fly-keys.git"
# EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"

EGIT_REPO_URI="https://github.com/akater/xah-fly-keys.git"
EGIT_BRANCH="akater-local"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.md"
