# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Attempt at mode for trace output and one extra feature for trace"
HOMEPAGE="https://gitlab.com/akater/elisp-trace-mode"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/mmxx-macros
"
RDEPEND="
	app-emacs/akater-misc"

DEPEND="test? ( app-emacs/ort )"
