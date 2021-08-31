# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Helm interface for company-mode"
HOMEPAGE="https://github.com/Sodel-the-Vociferous/helm-company"

EGIT_REPO_URI="https://github.com/Sodel-the-Vociferous/helm-company.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

BDEPEND="
	>=app-emacs/company-0.6.13
"
RDEPEND="
	>=app-emacs/helm-1.5.9
	>=app-emacs/company-0.6.13
"
