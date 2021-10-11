# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs Lisp accessory functions used by akater"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-misc"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND="
	app-emacs/anaphora
"

SITEFILE="50{PN}-gentoo.el"
