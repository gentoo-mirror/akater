# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3 git-extras

DESCRIPTION="Portage viewer"
HOMEPAGE="https://github.com/kiwanami/emacs-portage-navi"

EGIT_REPO_URI="https://github.com/akater/emacs-portage-navi.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="mirror"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
	app-portage/eix
	app-portage/gentoolkit
"

src_prepare() {
	git branch work
	git switch work
	git-merge fix-build
	git-merge stylistic-fixes
	git-merge introduce-defcustoms
	git-merge store-package-object

	default
}
