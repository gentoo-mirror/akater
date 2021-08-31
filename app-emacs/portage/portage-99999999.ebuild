# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit orgmode akater-live-release
# inherit orgdev git-r3

DESCRIPTION="Emacs interface to Portage"
HOMEPAGE="https://gitlab.com/akater/emacs-portage"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-portage.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="smart-live-rebuild"

DOCS="README.org"

RDEPEND="
	app-admin/sudo
	app-portage/eix
	app-portage/gentoolkit
	smart-live-rebuild? ( app-portage/smart-live-rebuild )
	app-emacs/portage-navi
	app-emacs/gentoo-cache
	app-emacs/transient
	app-emacs/akater-misc
	app-emacs/akater-sh
	app-emacs/ebuild-tools
"

SITEFILE=70emacs-${PN}-gentoo.el
