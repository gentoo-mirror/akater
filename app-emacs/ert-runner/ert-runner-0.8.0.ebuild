# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_PN="${PN}.el"
MY_P="${MY_PN}-${PV}"
inherit elisp

DESCRIPTION="Opinionated Ert testing workflow"
HOMEPAGE="https://github.com/rejeep/ert-runner.el"

SRC_URI="https://github.com/rejeep/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/ansi-0.1.0
	>=app-emacs/commander-0.2.0
	>=app-emacs/dash-1.8.0
	>=app-emacs/f-0.10.0
	>=app-emacs/s-1.6.1
	>=app-emacs/shut-up-0.1.0
"

S="${WORKDIR}/${MY_P}"
