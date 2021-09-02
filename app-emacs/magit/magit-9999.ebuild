# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=25

inherit elisp git-r3

DESCRIPTION="A Git porcelain inside Emacs"
HOMEPAGE="https://magit.vc/"

# EGIT_REPO_URI="https://github.com/magit/magit.git"
# EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/akater/magit.git"
EGIT_BRANCH="relaxed-conditions-for-password-functions"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="libgit"

S="${WORKDIR}/${P}/lisp"
SITEFILE="50${PN}-gentoo.el"
ELISP_TEXINFO="../Documentation/*.texi"
DOCS="../README.md ../Documentation/AUTHORS.md ../Documentation/RelNotes/*"

BDEPEND="
	>=app-emacs/dash-2.14.1
	app-emacs/transient
	>=app-emacs/with-editor-2.8.0
	sys-apps/texinfo
	libgit? ( app-emacs/libegit2 )
"
# transient 20190812 is required but we don't have support for such versions
RDEPEND="${BDEPEND}
	>=dev-vcs/git-2.0.0
	libgit? ( dev-libs/libgit2
			  app-emacs/libegit2 )
"

src_prepare() {
	default

	if ! use libgit ; then
		rm magit-libgit.el
	fi

	echo "(setq magit-version \"$(date --utc +%Y%m%d.0)\")" > magit-version.el || die

	eapply_user
}