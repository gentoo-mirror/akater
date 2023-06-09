# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_PN="emacs-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Functions to deal with ebuilds in Emacs Lisp"
HOMEPAGE="https://gitlab.com/akater/emacs-ebuild-tools"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="+eix gentoolkit"
# it does not really work with gentoolkit
REQUIRED_USE="|| ( eix gentoolkit ) eix"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/file-tree
	app-emacs/akater-misc
	app-emacs/mmxx-macros
	app-emacs/shmu
"
RDEPEND="${BDEPEND}
	app-emacs/shmu[privileged]
	app-emacs/akater-conf
	eix? ( app-emacs/eix
		   app-portage/eix )
	gentoolkit? ( app-portage/gentoolkit )
	app-emacs/gentoo-cache
"

SITEFILE="50${PN}-gentoo.el"
