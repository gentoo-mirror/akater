# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=27

MY_PN="elisp-${PN}"
inherit orgdev akater-live-release

DESCRIPTION="A port of dev-lisp/asdf to Emacs Lisp"
HOMEPAGE="https://framagit.org/akater/elisp-esdf"

EGIT_REPO_URI="https://framagit.org/akater/elisp-esdf.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND="test? ( app-emacs/akater-misc )"

src_prepare() {
	orgdev_src_prepare
}
