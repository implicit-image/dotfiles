(require 'ox-publish)
(require 'org)
(require 'org-roam-protocol)
(require 'org-roam-export)
(require 'htmlize)

(setq org-export-with-broken-links 'mark
      org-export-with-section-numbers nil
      org-publish-use-timestamps-flag t
      org-html-htmlize-output-type 'css
      org-html-html5-fancy t)

(setq org-export-global-macros
      '(("timestamp" . "@@html:<span class=\"timestamp\">$1 | </span>@@")
        ("taglist" . "@@html:< @@")))

(defun lc/org-sitemap-date-entry-format (entry style project)
  "Format ENTRY in org-publish PROJECT Sitemap format ENTRY ENTRY STYLE format that includes date."
  (let
      ((filename (org-publish-find-title entry project)))
    (if (= (length filename) 0)
        (format "*%s*" entry)
      (format
       "{{{timestamp(%s)}}} [[file:%s][%s]]"
       (format-time-string
        "%Y-%m-%d"
        (org-publish-find-date entry project))
       entry filename))))


(defun wiki/make-org-sitemap-entry (entry style project)
  "Format ENTRY"
  (let ((filename (org-publish-find-title entry project))
        (tags (org-publish-find-property entry project))))
  (format
   "{{{timestamp(%s)}}} [[file:%s][%s]]"
   (format-time-string
    "%Y-%m-%d"
    (org-publish-find-date entry project))
   ))

(setq wiki/html-head  "<link rel=\"stylesheet\" href=\"../../css/style.css\" type=\"text/css\"/><link rel=\"stylesheet\" href=\"../css/style.css\" type=\"text/css\"/>")

(setq wiki/html-preamble
      "<nav class=\"hor-list flex-container-row\">
        <a href=\"/\">about</a>
        <a href=\"/notes/\"><u><b>notes</b></u></a>
        <a href=\"/writing\">writing<</a>
    </nav>")

(setq wiki/html-postamble
      "<script src=\"/js/notes.js\"></script>
<footer>
        <div class=\"copyright-container\">
        <div class=\"copyright\">
      Copyright &copy; 2023 Błażej Niewiadomski some rights reserved<br/>
        </div>
        </div>
        </footer>")

(setq writing/html-head  "<link rel=\"stylesheet\" href=\"../../css/style.css\" type=\"text/css\"/><link rel=\"stylesheet\" href=\"../css/style.css\" type=\"text/css\"/>")

(setq writing/html-preamble
      "<nav class=\"hor-list flex-container-row\">
        <a href=\"/\">about</a>
        <a href=\"/notes\">notes</a>
        <a href=\"/writing/\"><u><b>writing</b></u></a>
    </nav>")

(setq writing/html-postamble
      "<footer>
        <div class=\"copyright-container\">
        <div class=\"copyright\">
      Copyright &copy; 2023 Błażej Niewiadomski some rights reserved<br/>
        </div>
        </div>
        </footer>")



(setq website/wiki-publish-info
      `(("wiki-posts"
         :with-latex t
         :with-toc t
         :base-directory "~/org/roam/"
         :base-extension "org"
         :publishing-directory ,(substitute-in-file-name "$HOME/projects/implicit-image.github.io/notes")
         :publishing-function org-html-publish-to-html
         :html-doctype "html5"
         :html-html5-fancy t
         :html-head ,wiki/html-head
         :html-preamble ,wiki/html-preamble
         :html-postamble ,wiki/html-postamble
         :auto-sitemap t
         :sitemap-title "notes"
         :sitemap-filename "index.org"
         :sitemap-sort-folders 'ignore
         :sitemap-ignore-case t
         :sitemap-format-entry lc/org-sitemap-date-entry-format)
        ("wiki-resources"
         :base-directory "~/org/roam/resources/"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png\\|pdf"
         :recursive t
         :publishing-directory  ,(substitute-in-file-name "$HOME/projects/implicit-image.github.io/notes/resources/")
         :publishing-function org-publish-attachment)
        ("personal-wiki" :components ("wiki-posts" "wiki-resources"))))

(setq website/writing-publish-info
      `(("writing-posts"
         :base-directory "~/org/writing/"
         :base-extension "org"
         :exclude-tags ("noexport" "notready")
         :with-author t
         :timestamp nil
         :with-date t
         :recursive t
         :publishing-directory ,(substitute-in-file-name "$HOME/projects/implicit-image.github.io/writing/")
         :publishing-function org-html-publish-to-html
         :html-doctype "html5"
         :html-head ,writing/html-head
         :html-preamble ,writing/html-preamble
         :html-postamble ,writing/html-postamble
         :with-latex t
         :headline-levels 1
         :makeindex t
         :auto-sitemap t
         :sitemap-title "my writing"
         :sitemap-filename "index.org"
         :sitemap-sort-files 'chronologically
         :sitemap-sort-folders 'ignore
         :sitemap-ignore-case t
         :sitemap-format-entry my/org-sitemap-date-entry-format)
        ("writing-resources"
         :base-directory ,(substitute-in-file-name "$HOME/org/writing")
         :base-extension "css\\|txt\\|jpg\\|gif\\|png\\|pdf"
         :recursive t
         :publishing-directory  ,(substitute-in-file-name "$HOME/projects/implicit-image.github.io/writing/")
         :publishing-function org-publish-attachment)
        ("writing" :components ("writing-posts" "writing-resources"))))

(setq website/learning-publish-info
      `(("learning-notes"
         :with-latex t
         :with-toc t
         :base-directory "~/org/learning/src"
         :base-extension "org"
         :publishing-directory ,(substitute-in-file-name "$HOME/projects/implicit-image.github.io/learning/")
         :publishing-function org-html-publish-to-html
         :html-doctype "html5"
         :html-html5-fancy t
         :html-head ,wiki/html-head
         :html-preamble ,wiki/html-preamble
         :html-postamble ,wiki/html-postamble
         :auto-sitemap t
         :sitemap-title "notes"
         :sitemap-filename "index.org"
         :sitemap-sort-folders 'ignore
         :sitemap-ignore-case t
         :sitemap-format-entry lc/org-sitemap-date-entry-format)
        ("learning-resources"
         :base-directory "~/org/learning/resources/"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png\\|pdf"
         :recursive t
         :publishing-directory  ,(substitute-in-file-name "$HOME/projects/implicit-image.github.io/learning/resources/")
         :publishing-function org-publish-attachment)
        ("learning" :components ("learning-notes" "learning-resources"))))

(setq org-publish-project-alist (append
                                 website/wiki-publish-info
                                 website/writing-publish-info
				 website/learning-publish-info))

(provide 'implicit-image-dot-github-dot-io)
