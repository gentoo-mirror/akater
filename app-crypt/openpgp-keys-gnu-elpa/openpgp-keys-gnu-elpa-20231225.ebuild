# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used to sign GNU ELPA packages"
HOMEPAGE="https://www.gnu.org/software/emacs/"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

S="${WORKDIR}"
BDEPEND="=app-editors/emacs-29.1*
	app-crypt/gnupg"

src_install() {
	insinto /usr/share/openpgp-keys

	# I blindly copied the syntax from openpgp-keys-tor
	newins - elpa.gnu.org.asc < <(gpg -o - -a --import --import-options import-export \
		/usr/share/emacs/29.1.50/etc/package-keyring.gpg || die)
}
