# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp cmake
# todo: ninja-related files are created in a build directory
# even though ninja is not mentioned anywhere. Where does it get picked?

DESCRIPTION="Emacs module for libgit2"
HOMEPAGE="https://github.com/magit/libegit2"

EGIT_REPO_URI="https://github.com/magit/libegit2.git"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-libgit"

RDEPEND="
	>=app-editors/emacs-25.1[dynamic-loading]
	system-libgit? ( dev-libs/libgit2 )
"

BDEPEND="${RDEPEND}
	>=dev-util/cmake-3.0
"
# todo: another build (?) dependency is app-eselect/eselect-emacs::akater
# as we need /usr/include/emacs symlink and it is only set by eselect in my ebuild repository

S="${WORKDIR}/${PV}/src"

src_prepare() {
	rm emacs-module.h
	eapply "${FILESDIR}"/${PN}-system-emacs-module.patch
	# use system-libvterm && eapply ${FILESDIR}/${PN}-system-libvterm.patch
	# there is a conceptual problem: this system-libvterm patch is essentially a configuration patch and thus it should be applied at configure stage. The general issue is, emacs packages do not provide any way to configure them. I guess this is common for Lisp systems but I'm not convinced it has to be so.

	cmake_src_prepare

	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LIBVTERM=$(usex system-libgit)
		# $(cmake-utils_use_use system-libgit SYSTEM_LIBGIT2)
		# I wish this symbol conversion happened automatically
		# but apparently this is banned in eapi 6 and later
	)

	# CMakeLists.txt has this:
	#
	# add_subdirectory(libgit2)
	#
	# find_library(git2 libgit2.a)
	# add_subdirectory(src)

	cmake_src_configure
}

src_compile() {

	cmake_src_compile || die "Compiling libgit-module failed"

	elisp-compile "${WORKDIR}/${PV}"/libgit.el || die "Compiling libgit.el failed"

}

src_install() {
	# Install vterm.el
	elisp-install ${PN} "${WORKDIR}/${PV}"/libgit.{el,elc} || die "Cannot install libgit elisp files"
	# elisp-install ${PN} "${WORKDIR}/${PV}"*.{el,elc} || die "Cannot install libgit elisp files"

	# Install module
	elisp-install ${PN} egit-*.so || die "Cannot install egit-*.so"

	# elisp-install LICENSE

	# Install docs
	dodoc "${WORKDIR}/${PV}"/README.md

	# if cmake-utils_src_install is run before elisp-install,
	# it prevents all further installs
	# and it doesn't do anything by itself
	#
	# cmake-utils_src_install

}
