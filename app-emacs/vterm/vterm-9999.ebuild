# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp
inherit cmake-utils
# todo: ninja-related files are created in a build directory
# even though ninja is not mentioned anywhere. Where does it get picked?

DESCRIPTION="Emacs package package implementing a terminal via libvterm"
HOMEPAGE="https://github.com/akermu/emacs-libvterm"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/akermu/emacs-libvterm.git"
	EGIT_BRANCH="master"
	KEYWORDS="~amd64 ~x86"
# else
# 	SRC_URI="https://github.com/akermu/emacs-libvterm/releases/download/v0.0.1/vterm-${PV}-src.tar.gz -> ${P}.tar.gz"
# 	RESTRICT="mirror"
# 	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="system-libvterm"

RDEPEND="
	>=app-editors/emacs-25.1[dynamic-loading]
	system-libvterm? ( dev-libs/libvterm )
"

BDEPEND="${RDEPEND}
	>=dev-util/cmake-3.11
"
# todo: another build (?) dependency is app-eselect/eselect-emacs::akater
# as we need /usr/include/emacs symlink and it is only set by eselect in my ebuild repository


# libtool-bin (related issues:
#     [#66](https://github.com/akermu/emacs-libvterm/issues/66)
#     [#85](https://github.com/akermu/emacs-libvterm/issues/85#issuecomment-491845136))

CMAKE_MIN_VERSION=3.11

src_prepare() {
	# elisp_src_prepare
	eapply ${FILESDIR}/${PN}-remove-elisp-compile.patch
	eapply ${FILESDIR}/${PN}-system-emacs-module.patch

	cmake-utils_src_prepare

	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LIBVTERM=$(usex system-libvterm)
		# $(cmake-utils_use_use system-libvterm SYSTEM_LIBVTERM)
		# I wish this symbol conversion happened automatically
		# but apparently this is banned in eapi 6 and later
	)
	cmake-utils_src_configure
}

src_compile() {
	# # todo: if we want true elpa installation, we need to produce -pkg and -autoloads as well --- maybe not here but during src_install.

	# external build can also be handled by elisp function vterm-module-compile
	# so we have plenty of options

	# 1 use elisp code, like (vterm-module-compile) in our case
	# We thus don't use cmake directly. This is not a universal
	# solution, i.e. it's not aligned with Gentoo
	# but it should be supported, I believe

	# 1.1 have a separate elisp file
	# and start emacs twice: once for byte-compilation,
	# and the second time, for external build

	# elisp-compile vterm.el || die "Compiling vterm.el failed"

	# ebegin "Compiling vterm-module.so"
	# ${EMACS} ${EMACSFLAGS} --load "vterm-module-make.el" \
	# 		               --eval "(vterm-module-compile)"
	# eend $? "ebuild: vterm-module-make failed" || die

	# 1.2 Start emacs only once
	# ebegin "Compiling vterm.el and vterm-module.so"
	# ${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} \
	# 		 --eval "(byte-compile-file \"vterm.el\")" \
	# 		 --eval "(load \"vterm-module-make\")" \
	# 		 --eval "(vterm-module-compile)"
	# eend $? "ebuild: compiling vterm failed or vterm-module-make failed" || die
	# This is generally faster but not clean, and we have no proper einfo output in the terminal
	# Hopefully, this can be fixed but it's non-trivial
	# Also, note that this vterm-module-compile has $S as default directory
	# so it makes no sense to install vterm-module-make.el

	# but overall this makes no sense for Gentoo-alikes,
	# and the only approach that does make sense is:

	# 2 do not use elisp code
	elisp-compile vterm.el || die "Compiling vterm.el failed"
	cmake-utils_src_compile || die "Compiling vterm-module failed"
	# just the canonical Gentoo way.
	# code like this can be generated with sane elisp packaging DSL
}

src_install() {
	# Install vterm.el
	elisp-install ${PN} vterm.{el,elc} || die "Cannot install vterm elisp files"
	# elisp-install ${PN} *.{el,elc} || die "Cannot install vterm elisp files"

	# Install vterm-module
	elisp-install ${PN} vterm-module.so || die "Cannot install vterm-module.so"

	# elisp-install LICENSE

	# Install docs
	dodoc README.md

	# if cmake-utils_src_install is run before elisp-install,
	# it prevents all further installs
	# and it doesn't do anything by itself
	#
	# cmake-utils_src_install

}
