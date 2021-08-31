# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

MY_PN="emacs-${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Use Portage's equery from Emacs"
HOMEPAGE="https://gitlab.com/akater/emacs-gentoolkit"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

BDEPEND="
	app-emacs/anaphora
	app-emacs/akater-misc"
RDEPEND="
	app-emacs/akater-sh
	app-portage/gentoolkit
"
