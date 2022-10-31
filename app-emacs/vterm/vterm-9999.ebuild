# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp cmake git-r3 git-extras

DESCRIPTION="Emacs package implementing a terminal via libvterm"
HOMEPAGE="https://github.com/akermu/emacs-libvterm"

# EGIT_REPO_URI="https://github.com/akermu/emacs-libvterm.git"
EGIT_REPO_URI="https://github.com/akater/emacs-libvterm.git"
EGIT_CLONE_TYPE="mirror"
EGIT_BRANCH="gentoo"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="fish +system-libvterm zsh"
# -system-libvterm does not work, see below

RDEPEND="
	>=app-editors/emacs-25.1[dynamic-loading]
	system-libvterm? ( dev-libs/libvterm )
"

BDEPEND="${RDEPEND}
	>=app-eselect/eselect-emacs-1.19
	>=dev-util/cmake-3.11
"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"

src_prepare() {
	if ! use system-libvterm ; then
		git switch vendor_libvterm
		# this branch is old so this doesn't work
		git branch work
		git switch work
		git-merge gentoo
	fi
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LIBVTERM=$(usex system-libvterm On Off)
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
	elisp_src_compile
}

src_install() {
	elisp_src_install
	elisp-modules-install ${PN} vterm-module.so

	insinto /etc/bash/
	doins etc/emacs-vterm-bash.sh

	# The following files are example configuration files for various shells.
	# You can put them anywhere and source the correct one in your shell.
	# Alternatively, you can ignore them and configure your shell
	# as you prefer according to the readme
	# --- Gabriele Bozzola @Sbozzolo on Telegram

	if use fish ; then
		insinto /etc/fish/
		doins etc/emacs-vterm.fish
	fi

	if use zsh ; then
		insinto /etc/zsh/
		doins etc/emacs-vterm-zsh.sh
	fi

}
