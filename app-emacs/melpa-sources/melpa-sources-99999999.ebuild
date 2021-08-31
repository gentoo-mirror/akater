# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# We do not call it “melpa-recipes”
# because this package also ships Elisp library package-build
# which is sometimes needed on its own

# This package does not attempt to build MELPA
# because building MELPA involves fetching
# which is discouraged by Portage

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Milkman Emacs Lisp Package Archive recipes"
HOMEPAGE="https://github.com/melpa/melpa"

EGIT_REPO_URI="https://github.com/melpa/melpa.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="package-build recipes sources"
# IUSE="package-build recipes savedconfig sources"
# todo: support installing only recipes in savedconfig

DOCS=( "README.md" "LICENSE.md" "CONTRIBUTING.org" )

REQUIRED_USE="|| ( package-build recipes sources )
				 sources? ( recipes )"

# we need a repo called eelpa (Ebuild ELPA), which depends on external source of package data one of which supported is melpa-recipes

RDEPEND="
		sources? ( dev-vcs/git )
"

src_prepare() {
	default
}

src_compile() {
	if use package-build ; then
		cd package-build
		elisp-compile *.el
	fi
}

src_install() {
	if use package-build ; then
		elisp-install package-build package-build/*.{el,elc}
		rm -r package-build
		# For melpa sources, we'll make a symlink instead
	fi

	# todo: if savedconfig, remove recipes not in saved config
	if use recipes ; then
		RECIPESDIR="/usr/share/melpa-recipes"
		cp "${FILESDIR}/50${PN}-gentoo.el" "${T}/50${PN}-gentoo.el"
		sed -i -e "s:@RECIPESDIR@:${RECIPESDIR}:g" \
			"${T}/50${PN}-gentoo.el"
		elisp-site-file-install "${T}/50${PN}-gentoo.el"
		insinto ${RECIPESDIR}
		doins recipes/*
	fi
	rm -r recipes
	# For melpa sources, we'll make a symlink instead

	# todo: if savedconfig, install new default savedconfig
	# consisting of all existing recipes
	#
	# This might not be a good idea as the list grows all the time
	# but it'd be nice to have versioned lists

	if use sources ; then
		MELPADIR="/usr/src/melpa"
		insinto "${MELPADIR}"
		doins Makefile
		doins -r \
			  Makefile docker \
			  html html-stable logo \
			  packages packages-stable \
			  run-ci.sh \
			  scripts service working
		dosym "${RECIPESDIR}" "${MELPADIR}"/recipes
		if use package-build ; then
			# todo: alter Makefile
			# so it loads compiled version of package-build
			dosym "${SITELISP}"/package-build "${MELPADIR}"/package-build
		else
			doins -r package-build
		fi
	fi
	einstalldocs
}

pkg_postinst() {
	use recipes && elisp-site-regen
}

pkg_postrm() {
	use recipes && elisp-site-regen
}
