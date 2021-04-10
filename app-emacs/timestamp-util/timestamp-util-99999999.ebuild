# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Define Elisp timestamp matchers"
HOMEPAGE="https://gitlab.com/akater/elisp-timestamp-util"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-timestamp-util.git"
EGIT_BRANCH="release"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DOCS="README.org"

BDEPEND=">=app-editors/emacs-27
	app-emacs/akater-misc
	app-emacs/anaphora
	app-emacs/looking-through
"

RDEPEND=">=app-editors/emacs-27
	app-emacs/akater-misc
"
