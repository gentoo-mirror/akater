# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="emacs-${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs interface to mount via transient"
HOMEPAGE="https://gitlab.com/akater/emacs-transient-mount"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

BDEPEND="
	app-emacs/anaphora
"
RDEPEND="
	>=sys-apps/util-linux-2.18
	app-admin/sudo
	app-emacs/transient
	app-emacs/akater-misc
	app-emacs/akater-sh
"
