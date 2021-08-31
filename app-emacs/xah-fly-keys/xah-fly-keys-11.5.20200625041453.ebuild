# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp git-r3

DESCRIPTION="Ergonomic modal keybinding minor mode."
HOMEPAGE="http://ergoemacs.org/misc/ergoemacs_vi_mode.html"

EGIT_REPO_URI="https://github.com/xahlee/xah-fly-keys.git"
EGIT_COMMIT="2f06e1c83b097ed436f7fd12490f540f6ad6e6e1"
EGIT_CLONE_TYPE="single+tags"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.md"

PATCHES="${FILESDIR}/temporary.patch"
