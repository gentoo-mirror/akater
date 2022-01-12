# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Modular text completion framework"
HOMEPAGE="http://company-mode.github.io/"

EGIT_REPO_URI="https://github.com/company-mode/company-mode.git"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="helm"

LICENSE="GPL-3"
SLOT="0"

DOCS="NEWS.md README.md"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	helm? ( app-emacs/helm-company )
"
