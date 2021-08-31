# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26.1"

inherit elisp git-r3

DESCRIPTION="A library to write Emacs Lisp codes in org mode"
HOMEPAGE="https://github.com/jingtaozf/literate-elisp"

# EGIT_REPO_URI="https://gitlab.com/akater/literate-elisp.git"
EGIT_REPO_URI="https://github.com/jingtaozf/literate-elisp.git"
EGIT_BRANCH="master"
EGIT_COMMIT_TIPE="single+tags"
KEYWORDS="~amd64"
IUSE="bootstrap"

LICENSE="GPL-3"
SLOT="0"

DOCS="literate-elisp.org readme.org"

BDEPEND="
	bootstrap? ( || ( app-emacs/org app-emacs/org-mode ) )"

src_compile() {
	if use bootstrap ; then
		ewarn "This will fail because literate-elisp apparently was never supposed to bootstrap"
		rm literate-elisp.el
		${EMACS} -q -L . -batch                               \
				 --eval "(require 'ob-tangle)"                \
				 --eval "(require 'org)"                      \
				 --eval "(defalias 'poly-org-mode 'org-mode)" \
				 --eval "(require 'rx)" \
				 --eval "\
(with-current-buffer (find-file-noselect \"literate-elisp.org\") \
  (while (re-search-forward                                      \
		   (rx line-start \"#+BEGIN_SRC elisp :load no\") nil t) \
	(replace-match \"#+BEGIN_SRC elisp :tangle no\" nil nil)) \
  (goto-char 1) \
  (while (re-search-forward                      \
		   (rx line-start \"#+PROPERTY: header-args :results silent\") nil t) \
  (replace-match \"#+PROPERTY: header-args :results silent :tangle yes\" nil nil)) \
  (save-buffer) (kill-buffer)) \
" \
				 --eval "(org-babel-tangle-file \"literate-elisp.org\")" \
				 --eval "(with-current-buffer (find-file-noselect \"literate-elisp.el\") (goto-char 1) (insert \";;; -*- lexical-binding: t -*-\n\") (save-buffer) (kill-buffer))" \
				 --eval "\
(with-current-buffer (find-file-noselect \"literate-elisp.org\") \
  (while (re-search-forward   \
		   (rx line-start \"#+BEGIN_SRC elisp :tangle no\") nil t) \
	(replace-match \"#+BEGIN_SRC elisp :load no\" nil nil)) \
  (goto-char 1)   \
  (while (re-search-forward \
			 (rx line-start \"#+PROPERTY: header-args :results silent :tangle yes\") nil t) \
	(goto-char 1) \
  (replace-match \"#+PROPERTY: header-args :results silent\" nil nil)) \
  (save-buffer) (kill-buffer))" \
			|| die "org-babel-tangle-file failed"

		# literate-elisp is tangled incorrectly and thus can't be loaded
		# it is unclear how to tangle it correctly
		${EMACS} -q -L . -batch                               \
				 --eval "(let ((lexical-binding t))           \
						   (load \"literate-elisp.el\"))"       \
				 --eval "(require 'org)"                      \
				 --eval "(defalias 'poly-org-mode 'org-mode)" \
				 --eval "(with-current-buffer (find-file-noselect        \
												\"literate-elisp.org\")    \
						   (goto-char 1)                                 \
						   (re-search-forward \"^(literate-elisp-tangle\") \
						   (beginning-of-line)                           \
						   (eval (read (current-buffer))))" \
			|| die "literate-elisp-tangle failed"

		elog "literate-elisp-tangle done"
# 						   (forward-sexp) (eval-last-sexp))"              \

		${EMACS} -q -L . -batch \
				 --eval "(require 'literate-elisp)" \
				 --eval "(require 'poly-org)"                      \
				 --eval '(literate-elisp-byte-compile-file "literate-elisp.org")' \
			|| die "literate-elisp-byte-compile-file failed"
	else
		elisp-compile *.el || die "Compiling *.el failed"
	fi
}

src_install() {
	if use bootstrap ; then
		rm literate-elisp{.el,.elc}
		elisp-install ${PN} literate-elisp.org
		elisp-install ${PN} literate-elisp.org.elc
		# todo: dodoc readme.org
	else
		elisp-install ${PN} *.{el,elc} || die "Cannot install elisp files"
		case ${EAPI} in
			4|5) [[ -n ${DOCS} ]] && dodoc ${DOCS} ;;
			*) [[ $(declare -p DOCS 2>/dev/null) == *=* ]] && einstalldocs ;;
		esac
	fi
}
