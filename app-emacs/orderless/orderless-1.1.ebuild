# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27"

ELPA_CONTAINER_KIND=tar
inherit elpa readme.gentoo-r1

DESCRIPTION="Completion style that matches multiple regexps in any order"

SLOT="0"
KEYWORDS="amd64 ~x86"

BDEPEND="sys-apps/texinfo"

SITEFILE="50${PN}-gentoo.el"
DOC_CONTENTS="Enable orderless completion by placing
	\"(setq completion-styles '(orderless))\" in your .emacs file."
ELISP_TEXTINFO="${PN}.texi"

src_compile() {
	elisp_src_compile
	elisp-make-autoload-file
}
