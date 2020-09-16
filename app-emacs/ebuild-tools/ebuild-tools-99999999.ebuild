# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Functions to deal with ebuilds in Emacs Lisp"
HOMEPAGE="https://gitlab.com/akater/emacs-ebuild-tools"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-ebuild-tools.git"
EGIT_BRANCH="release"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="+eix gentoolkit"
# it does not really work with gentoolkit
REQUIRED_USE="|| ( eix gentoolkit )"

DOCS="README.org"

BDEPEND=">=app-editors/emacs-24
	app-emacs/file-tree
	app-emacs/akater-misc
"
RDEPEND="${BDEPEND}
	app-admin/sudo
	app-emacs/akater-sh
	app-emacs/akater-conf
	eix? ( app-emacs/eix
		   app-portage/eix )
	gentoolkit? ( app-portage/gentoolkit )
	app-emacs/gentoo-cache
"