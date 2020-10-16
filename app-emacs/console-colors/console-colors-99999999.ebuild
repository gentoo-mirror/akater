# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs interface to console colors"
HOMEPAGE="https://gitlab.com/akater/emacs-console-colors"

EGIT_REPO_URI="https://gitlab.com/akater/emacs-console-colors.git"
EGIT_BRANCH="release"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DOCS="README.org"

BDEPEND=">=app-editors/emacs-25
	app-emacs/anaphora
	app-emacs/akater-misc"
RDEPEND=">=app-editors/emacs-25
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
