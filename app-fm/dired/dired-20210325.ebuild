# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27.2"

inherit elisp

DESCRIPTION="Dired File Manager"
HOMEPAGE="https://www.gnu.org/software/emacs/manual/html_node/emacs/Dired.html "

IUSE="+inotify"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~mips ppc ppc64 ~riscv sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"

RDEPEND="
	inotify? ( app-editors/emacs[inotify] )
	app-emacs/helm
	app-emacs/which-key
"

src_unpack() {
	mkdir "${P}"
	cp "${FILESDIR}"/dired-standalone.el "${P}"
}

src_prepare() {
	use inotify || eapply "${FILESDIR}"/no-inotify.patch
	default
}

src_install () {
	elisp-install "${PN}-standalone" dired-standalone.el
	dobin "${FILESDIR}"/dired
}
