# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Emacs Lisp's looking-at, followed by movement if match succeeded"
HOMEPAGE="https://gitlab.com/akater/elisp-looking-through"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-looking-through.git"
EGIT_BRANCH="release"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DOCS="README.org"

BDEPEND=">=app-editors/emacs-25
	app-emacs/akater-misc
	app-emacs/anaphora
"

RDEPEND=">=app-editors/emacs-25
	app-emacs/akater-misc
"
