(add-to-list 'load-path "@SITELISP@")
(custom-set-variables
 '(pdf-info-epdfinfo-program "/usr/bin/epdfinfo"))
(autoload 'pdf-annot-minor-mode "pdf-annot" "\
Support for PDF Annotations.

\\{pdf-annot-minor-mode-map}

\(fn &optional ARG)" t nil)
(autoload 'pdf-history-minor-mode "pdf-history" "\
Keep a history of previously visited pages.

\\{pdf-history-minor-mode-map}

\(fn &optional ARG)" t nil)
(autoload 'pdf-isearch-minor-mode "pdf-isearch" "\
Isearch mode for PDF buffer.

\\{pdf-isearch-active-mode-map}

\(fn &optional ARG)" t nil)
(autoload 'pdf-links-minor-mode "pdf-links" "\
Handle links in PDF documents.\\<pdf-links-minor-mode-map>

\\{pdf-links-minor-mode-map}

\(fn &optional ARG)" t nil)
(autoload 'pdf-links-action-perform "pdf-links" "\
Follow LINK, depending on its type.

\(fn LINK)" t nil)
(autoload 'pdf-loader-install "pdf-loader" "\
Prepare Emacs for using PDF Tools.

\(fn &optional NO-QUERY-P SKIP-DEPENDENCIES-P NO-ERROR-P FORCE-DEPENDENCIES-P)" nil nil)
(autoload 'pdf-misc-minor-mode "pdf-misc" nil t nil)
(autoload 'pdf-misc-size-indication-minor-mode "pdf-misc" "\
Provide a working size indication in the mode-line.

\(fn &optional ARG)" t nil)
(autoload 'pdf-misc-menu-bar-minor-mode "pdf-misc" "\
Display a PDF Tools menu in the menu-bar.

\(fn &optional ARG)" t nil)
(autoload 'pdf-misc-context-menu-minor-mode "pdf-misc" "\
Provide a right-click context menu in PDF buffers.

\\{pdf-misc-context-menu-minor-mode-map}

\(fn &optional ARG)" t nil)
(autoload 'pdf-occur "pdf-occur" "\
List lines matching STRING or PCRE.

\(fn STRING &optional REGEXP-P)" t nil)
(autoload 'pdf-occur-multi-command "pdf-occur" "\
Perform `pdf-occur' on multiple buffer." t nil)
(defvar pdf-occur-global-minor-mode nil "\
Non-nil if Pdf-Occur-Global minor mode is enabled.
See the `pdf-occur-global-minor-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pdf-occur-global-minor-mode'.")
(custom-autoload 'pdf-occur-global-minor-mode "pdf-occur" nil)
(autoload 'pdf-occur-global-minor-mode "pdf-occur" "\
Enable integration of Pdf Occur with other modes.

\(fn &optional ARG)" t nil)
(autoload 'pdf-occur-ibuffer-minor-mode "pdf-occur" "\
Hack into ibuffer's do-occur binding.

\(fn &optional ARG)" t nil)
(autoload 'pdf-occur-dired-minor-mode "pdf-occur" "\
Hack into dired's `dired-do-search' binding.

\(fn &optional ARG)" t nil)
(autoload 'pdf-outline-minor-mode "pdf-outline" "\
Display an outline of a PDF document.

\\{pdf-outline-minor-mode-map}

\(fn &optional ARG)" t nil)
(autoload 'pdf-outline "pdf-outline" "\
Display an PDF outline of BUFFER.

\(fn &optional BUFFER NO-SELECT-WINDOW-P)" t nil)
(autoload 'pdf-outline-imenu-enable "pdf-outline" "\
Enable imenu in the current PDF buffer." t nil)
(autoload 'pdf-sync-minor-mode "pdf-sync" "\
Correlate a PDF position with the TeX file.
\\<pdf-sync-minor-mode-map>

\(fn &optional ARG)" t nil)
(defvar pdf-tools-handle-upgrades t "\
Whether PDF Tools should handle upgrading itself.")
(custom-autoload 'pdf-tools-handle-upgrades "pdf-tools" t)
(autoload 'pdf-tools-install "pdf-tools" "\
Install PDF-Tools in all current and future PDF buffers.

\(fn &optional NO-QUERY-P SKIP-DEPENDENCIES-P NO-ERROR-P FORCE-DEPENDENCIES-P)" t nil)

(autoload 'pdf-tools-enable-minor-modes "pdf-tools" "\
Enable MODES in the current buffer.

\(fn &optional MODES)" t nil)
(autoload 'pdf-tools-help "pdf-tools" nil t nil)
(autoload 'pdf-view-bookmark-jump-handler "pdf-view" "\
The bookmark handler-function interface for bookmark BMK.

\(fn BMK)" nil nil)
(autoload 'pdf-virtual-edit-mode "pdf-virtual" "\
Major mode when editing a virtual PDF buffer.

\(fn)" t nil)
(autoload 'pdf-virtual-view-mode "pdf-virtual" "\
Major mode in virtual PDF buffers.

\(fn)" t nil)
(defvar pdf-virtual-global-minor-mode nil "\
Non-nil if Pdf-Virtual-Global minor mode is enabled.
See the `pdf-virtual-global-minor-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pdf-virtual-global-minor-mode'.")
(custom-autoload 'pdf-virtual-global-minor-mode "pdf-virtual" nil)
(autoload 'pdf-virtual-global-minor-mode "pdf-virtual" "\
Enable recognition and handling of VPDF files.

\(fn &optional ARG)" t nil)
(autoload 'pdf-virtual-buffer-create "pdf-virtual" "\


\(fn &optional FILENAMES BUFFER-NAME DISPLAY-P)" t nil)
