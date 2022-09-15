# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

MY_PN="${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Simple nutrition tracking in Org"
HOMEPAGE="https://gitlab.com/akater/org-nutrition"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DOCS="README.org"

BDEPEND="
	app-emacs/anaphora
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"
RDEPEND="
	app-emacs/akater-misc"

src_configure() {
	local orgmode_configure_pn_defvars=("install-systemwide t")

	orgmode_src_configure
}

src_install() {
	orgmode_src_install
	insinto "/usr/share/${PN}/"
	doins examples/nutrition-data-sample.org
	doins examples/nutrition-sample.org
}
