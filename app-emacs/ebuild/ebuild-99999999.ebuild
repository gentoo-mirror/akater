# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Temporary package providing ebuild-run-mode for Emacs"
HOMEPAGE="https://gitlab.com/akater/elisp-ebuild"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-ebuild.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DOCS="README.org"

BDEPEND=">=app-editors/emacs-24"
RDEPEND="${BDEPEND}"
