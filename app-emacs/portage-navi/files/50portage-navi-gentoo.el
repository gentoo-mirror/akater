(add-to-list 'load-path "@SITELISP@")
(custom-set-variables
 '(pona:portage-dir (if (file-exists-p "/var/db/repos/gentoo")
                        "/var/db/repos/gentoo"
                      "/usr/portage")))
