# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

inherit elisp git-r3

DESCRIPTION="Elisp polymode for org-mode"
HOMEPAGE="https://github.com/polymode/poly-org"

# EGIT_REPO_URI="https://github.com/polymode/poly-org.git"
EGIT_REPO_URI="https://github.com/akater/poly-org.git"
# EGIT_BRANCH="master"
# EGIT_BRANCH="elisp-inherit-lexical"
EGIT_BRANCH="lisp-inherit-package"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	>=app-emacs/polymode-0.2
"

BDEPEND="${RDEPEND}"
