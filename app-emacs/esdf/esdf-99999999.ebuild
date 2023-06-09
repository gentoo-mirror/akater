# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=27

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="A port of dev-lisp/asdf to Emacs Lisp"
HOMEPAGE="https://framagit.org/akater/elisp-esdf"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
DOCS="" # README.org is a relative symlink
