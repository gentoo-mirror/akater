# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Portage viewer"
HOMEPAGE="https://github.com/kiwanami/emacs-portage-navi"

EGIT_REPO_URI="https://github.com/akater/emacs-portage-navi.git"
EGIT_BRANCH="introduce-defcustoms"
KEYWORDS="amd64 x86"

LICENSE=GPL-3
SLOT=0

BDEPEND=">=app-editors/emacs-24"
RDEPEND=">=app-editors/emacs-24
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
	app-portage/eix
	app-portage/gentoolkit
"

src_compile() {
	elisp-compile *.el || \
		die "Could not compile"
}
