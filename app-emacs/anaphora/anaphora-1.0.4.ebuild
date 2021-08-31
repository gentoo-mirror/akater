# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="18"

inherit elisp

DESCRIPTION="Anaphoric macros for Emacs Lisp providing implicit temp variables"
HOMEPAGE="https://github.com/rolandwalker/anaphora"

SRC_URI="https://github.com/rolandwalker/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"

LICENSE="public-domain"
SLOT="0"
IUSE=""
