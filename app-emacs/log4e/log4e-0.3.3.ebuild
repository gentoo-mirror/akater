# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp

DESCRIPTION="Logging framework for Elisp"
HOMEPAGE="https://github.com/aki2o/log4e"

SRC_URI="https://github.com/aki2o/log4e/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
