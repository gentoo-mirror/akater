# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Major mode for editing PDF files"
HOMEPAGE="https://github.com/mishoo/pdf-mode.el"

# EGIT_REPO_URI="https://github.com/mishoo/pdf-mode.el.git"
# EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/akater/pdf-mode.el.git"
EGIT_BRANCH="gentoo"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

DOCS="README.md"
