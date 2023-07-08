# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="A sexp to sh translator and other *nix-related convenience stuff"
HOMEPAGE="https://framagit.org/akater/elisp-shmu"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="+privileged test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/mmxx-macros
"

RDEPEND="${BDEPEND}
	privileged? ( app-emacs/sudo-edit || ( app-admin/sudo app-admin/doas sys-apps/shadow ) )
"

DEPEND="test? ( app-emacs/ebuild-mode
				app-emacs/ort
				app-emacs/org-src-elisp-extras )"

SITEFILE="50${PN}-gentoo.el"
