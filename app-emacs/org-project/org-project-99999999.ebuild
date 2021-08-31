# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="${PN}"
inherit elisp orgmode akater-live-release

DESCRIPTION="Elisp package to create systems of org files from templates"
HOMEPAGE="https://gitlab.com/akater/org-project"

EGIT_REPO_URI="https://gitlab.com/akater/org-project.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	app-emacs/akater-misc
"

BDEPEND="${RDEPEND}"
