# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Useful Lisp macros developed ca. 2020"
HOMEPAGE="https://framagit.org/akater/elisp-mmxx-macros"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

SITEFILE="50${PN}-gentoo.el"

DEPEND="test? ( app-emacs/ort app-emacs/org-src-elisp-extras )"
