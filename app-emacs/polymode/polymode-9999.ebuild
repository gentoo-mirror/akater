# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

inherit elisp git-r3 git-extras

DESCRIPTION="Extensible framework for multiple GNU Emacs major modes"
HOMEPAGE="https://github.com/polymode/polymode"

# EGIT_REPO_URI="https://github.com/polymode/polymode.git"
EGIT_REPO_URI="https://github.com/akater/polymode.git"
EGIT_BRANCH="master"

EGIT_CLONE_TYPE="mirror"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

DOCS="docs/img docs/*.md"

src_prepare() {
	git branch work
	git switch work
	git-merge aggressive-narrow

	default
}
