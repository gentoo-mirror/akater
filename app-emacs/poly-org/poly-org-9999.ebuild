# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

inherit elisp git-r3 git-extras

DESCRIPTION="Elisp polymode for org-mode"
HOMEPAGE="https://github.com/polymode/poly-org"

# EGIT_REPO_URI="https://github.com/polymode/poly-org.git"
EGIT_REPO_URI="https://github.com/akater/poly-org.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="mirror"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	>=app-emacs/polymode-0.2
"

BDEPEND="${RDEPEND}"

src_prepare() {
	git branch work
	git switch work
	git-merge lisp-inherit-package
	git-merge modern-symbols

	default
}
