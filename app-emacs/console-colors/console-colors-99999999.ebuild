# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode akater-live-release

DESCRIPTION="Emacs interface to console colors"
HOMEPAGE="https://gitlab.com/akater/emacs-console-colors"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-console-colors.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="nopasswd"

DOCS="README.org"

BDEPEND="
	app-emacs/anaphora
"
RDEPEND="
	app-admin/sudo
	sys-apps/kbd
	app-emacs/akater-misc
	app-emacs/akater-sh"

src_install() {
	orgmode_src_install
	COLORMAPSDIR="/usr/share/colormaps/"
	insinto "${COLORMAPSDIR}"
	doins *.csv
	dosym material.csv "${COLORMAPSDIR}"dark
	dosym quasi-comaterial.csv "${COLORMAPSDIR}"light
}
