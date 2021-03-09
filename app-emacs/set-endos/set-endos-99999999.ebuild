# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp orgmode git-r3

DESCRIPTION="Elisp package that provides some interfaces to finite dynamical systems"
HOMEPAGE="https://gitlab.com/akater/elisp-set-endos"

EGIT_REPO_URI="https://gitlab.com/akater/elisp-set-endos.git"
EGIT_BRANCH="release"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=app-editors/emacs-26
	app-emacs/akater-misc
"

BDEPEND=">=app-editors/emacs-26
	app-emacs/anaphora
"
