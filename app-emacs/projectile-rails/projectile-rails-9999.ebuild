# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Minor mode for Rails projects based on projectile-mode"
HOMEPAGE="https://github.com/asok/projectile-rails"

EGIT_REPO_URI="https://github.com/asok/projectile-rails.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="hydra"

BDEPEND="
		>=app-emacs/inf-ruby-2.2.6
		>=app-emacs/inflections-1.1
		>=app-emacs/rake-0.3.2
		hydra? ( app-emacs/hydra )"
RDEPEND="
>=app-emacs/projectile-0.12.0
>=app-emacs/inflections-1.1
>=app-emacs/inf-ruby-2.2.6
>=app-emacs/f-0.13.0
>=app-emacs/rake-0.3.2
hydra? ( app-emacs/hydra )
"

src_prepare() {

	# eapply "${FILESDIR}"/enable-with-no-warnings.patch
	# this won't work because byte-run doesn't provide the feature
	use hydra || eapply "${FILESDIR}"/remove-defhydra.patch

	default
}
