# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

ELPA_URI="https://elpa.nongnu.org/nongnu"
ELPA_CONTAINER_KIND="tar"
inherit elpa

HOMEPAGE="https://github.com/thierryvolpiatto/wfnames"
DESCRIPTION="A mode to edit filenames, similar to wdired"

KEYWORDS="amd64 x86"

SLOT="0"

BDEPEND="verify-sig? ( >=app-crypt/openpgp-keys-gnu-elpa-20231225 )"
