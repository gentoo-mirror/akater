# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp git-r3

DESCRIPTION="Cask: Project management for package development"
HOMEPAGE="https://github.com/cask/cask"

EGIT_REPO_URI="https://github.com/cask/cask.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/ansi-0.4.1
	>=app-emacs/epl-0.5
	>=app-emacs/f-0.16.0
	app-emacs/melpa-sources[package-build]
	>=app-emacs/s-1.8.0
	>=app-emacs/shut-up-0.1.0
"

src_prepare() {
	rm package-*.el
	rm "${PN}-bootstrap.el"
	echo "(require 'cl-lib) (require 'ansi) (require 'epl) \
		  (require 'f) (require 'package-build) (require 's) \
		  (require 'shut-up) \
		  (provide '${PN}-bootstrap)" >> "${PN}-bootstrap.el"
	default
}

src_install() {
	elisp_src_install

	dobin bin/cask
}
