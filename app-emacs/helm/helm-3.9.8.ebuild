# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3 git-extras

DESCRIPTION="Emacs incremental completion and selection narrowing framework"
HOMEPAGE="https://emacs-helm.github.io/helm/"
# EGIT_REPO_URI="https://github.com/emacs-helm/${PN}.git"
EGIT_REPO_URI="https://github.com/akater/${PN}.git"
EGIT_COMMIT="6ae44dba"
EGIT_CLONE_TYPE="mirror"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="X"

RDEPEND="
	X? ( >=app-editors/emacs-25.1[gui] )
	!X? ( >=app-editors/emacs-25.1 )
	>=app-emacs/async-1.9.4
	>=app-emacs/wfnames-1.1
	>=app-emacs/popup-0.5.3"
BDEPEND="${RDEPEND}
	|| ( app-emacs/org app-editors/emacs[-minimal] )"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	elisp_src_prepare

	git branch work
	git switch work
	git-merge no-org

	use X || git-merge no-x

	eapply_user
}

src_compile() {
	elisp-compile *.el
	elisp-make-autoload-file
}

src_install() {
	elisp_src_install
	dobin emacs-helm.sh
}
