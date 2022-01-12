# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

MY_PN="${PN}.el"

DESCRIPTION="Automatic language detection from code snippets"
HOMEPAGE="https://github.com/andreasjansson/language-detection.el"
EGIT_REPO_URI="https://github.com/andreasjansson/${MY_PN}.git"
EGIT_COMMIT="54a6ecf55304fba7d215ef38a4ec96daff2f35a4"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
