(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(setq org-startup-truncated nil)
(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq create-lockfiles nil)
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(tool-bar-mode 0)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(ido-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)




;;indent
(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)



;;calibre
(use-package calibredb
  :defer t
  :init
  (autoload 'calibredb "calibredb")
  :config
  (setq calibredb-root-dir "~/CalibreLibrary")
  (setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
  (setq calibredb-library-alist '(("~/CalibreLibrary"))))




;; agenda view

;;(add-to-list 'org-agenda-files '(("." . "~/.emacs.d/agenda-files")))


;;smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-i d") 'neotree)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command);

;;haskell mode
(require 'lsp)
(require 'lsp-mode)
(require 'lsp-haskell)
(require 'haskell-mode)

(defun setup-haskell-mode ()
  (setq haskell-process-log t)
   (setq haskell-process-type "cabal-ghci")
  )

(add-hook 'haskell-mode-hook #'setup-haskell-mode)
(add-hook 'haskell-mode-hook 'lsp-mode)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;rust

(defun setup-rust-mode ()
  (setq lsp-rust-analyzer-call-info-full 1)
  (setq lsp-rust-analyzer-server-display-inlay-hints 0)
  (lsp-mode +1)
  (company-mode +1)
  (eldoc-mode +1)
   )

(require 'lsp-mode)
(add-hook 'rust-mode-hook #'setup-rust-mode)
(add-hook 'rust-mode-hook #'lsp) 

;;(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)


;;company
(require 'company)
;;(setq company-idle-delay -1)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-tooltip-offset-display 1)

	  
(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)
(global-set-key (kbd "M-p") 'ace-window)




;;tide
(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))


;;lisp
(defun setup-lisp-mode()
  (company-mode +1)
  (eldoc-mode +1)
  )
(add-hook 'emacs-lisp-mode #'#'setup-lisp-mode)

;; pdf
;;(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf))
;;(add-hook 'pdf-view-mode-hook #'pdf-tools-install)

;;javascript
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-hook 'js2-mode-hook #'setup-tide-mode)


;;react

(defun setup-react-mode()
  (flycheck-mode +1)
  (eldoc-mode +1)
  (company-mode +1)
  )

(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'setup-react-mode)

;;json
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;c



;;cpp




;;python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))





;;org

(require 'org)


;;vterm

;;dired





;;--custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "f4876796ef5ee9c82b125a096a590c9891cec31320569fc6ff602ff99ed73dca" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "56d10d2b60685d112dd54f4ba68a173c102eacc2a6048d417998249085383da1" "fd22c8c803f2dac71db953b93df6560b6b058cb931ac12f688def67f08c10640" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "e27556a94bd02099248b888555a6458d897e8a7919fd64278d1f1e8784448941" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "f94110b35f558e4c015b2c680f150bf8a19799d775f8352c957d9d1054b0a210" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "87d46d0ad89557c616d04bef34afd191234992c4eb955ff3c60c6aa3afc2e5cc" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "6b423e7cd5d1e705b0c92356273899057d26e125f83d7f007615ae088195682f" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "d9741f492c26b4e1c93874ee10476ca233e496827740b3fdb3aa6b6df871d449" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "4f77827c989554f290a8f98a123ea020550864fa43776ca219d9cc76f7c42a94" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "9ce93c9eb0f26697eadc71afb99214fa2c85396f6148ddabf5a8319e667513ae" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "d8e3a2b8c72c3cb52d070a5e1969849197488b92d7211cc86c97e033239fdde2" "4b2679eac1095b60c2065187d713c39fbba27039d75c9c928a1f3b5d824a3b18" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "08e0ba7881c93bc4ecb393df5de4c696ee820d586872ab5d42bb26834c9770eb" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "808b47c5c5583b5e439d8532da736b5e6b0552f6e89f8dafaab5631aace601dd" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "428bdd4b98d4d58cd094e7e074c4a82151ad4a77b9c9e30d75c56dc5a07f26c5" "e6a9337674f6c967311b939bb4f81aefb65a96908c3749f4dd8d4500f6d79242" "ef403aa0588ca64e05269a7a5df03a5259a00303ef6dfbd2519a9b81e4bce95c" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "a0bfb4d94ef0a0893a9b19628403c5ac4847c981c8942a50fde0f273df47424a" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "59ba50f24540958f33699a5247255d10f34dd812f3975837e3eddccdc4caa32e" "043c8375cad0cf1d5c42f5d85cbed601075caf09594da04a74712510e9437d2b" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "f6f5d5adce1f9a764855c9730e4c3ef3f90357313c1cae29e7c191ba1026bc15" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "02940c38e51991e8ee8ac69537341149d56e9c88d57f2c357eeb1744daad1953" "8c1dd3d6fdfb2bee6b8f05d13d167f200befe1712d0abfdc47bb6d3b706c3434" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "0fe24de6d37ea5a7724c56f0bb01efcbb3fe999a6e461ec1392f3c3b105cc5ac" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "bbb521edff9940ba05aeeb49f9b247e95e1cb03bd78de18122f13500bda6514f" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "3be1f5387122b935a26e02795196bc90860c57a62940f768f138b02383d9a257" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "91375c6dc506913ac7488f655b5afe934f343a0b223021c349105d37748c6696" "1d3863142a1325c1d038905c82b9aaf83f7594bb6158b52ad32ed23d3a97490a" "31e9b1ab4e6ccb742b3b5395287760a0adbfc8a7b86c2eda4555c8080a9338d9" "fb44ced1e15903449772b750c081e6b8f687732147aa43cfa2e7d9a38820744b" "46720e46428c490e7b2ddeafc2112c5a796c8cf4af71bd6b758d5c19316aff06" "8e51e44e5b079b2862335fcc5ff0f1e761dc595c7ccdb8398094fb8e088b2d50" "c2efd2e2e96b052dd91940b100d86885337a37be1245167642451cf6da5b924a" "65f35d1e0d0858947f854dc898bfd830e832189d5555e875705a939836b53054" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "819d24b9aba8fcb446aecfb59f87d1817a6d3eb07de7fdec67743ef32194438b" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "f66abed5139c808607639e5a5a3b5b50b9db91febeae06f11484a15a92bde442" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "7546a14373f1f2da6896830e7a73674ef274b3da313f8a2c4a79842e8a93953e" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(fci-rule-color "#405A61")
 '(frame-brackground-mode 'dark)
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(objed-cursor-color "#dc322f")
 '(package-selected-packages
   '(unicode-fonts calibredb emoji-display emoji-fontset base16-theme smooth-scrolling jss all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy all-the-icons-ivy-rich all-the-icons neotree lsp-pyright doom-modeline doom-themes image+ iscroll look-mode image-dired+ company-c-headers company-shell company-web css-eldoc scss-mode monokai-alt-theme highlight-indent-guides org-bullets use-package pdfgrep pdf-tools pdf-view-restore lua-mode magit org-present-remote vterm org-beautify-theme org-present ox-epub org-brain org-noter org json-mode typescript-mode rjsx-mode tide js2-mode web-mode ace-window company-lsp company-racer flycheck flycheck-rust racer cargo rust-mode ac-haskell-process company-ghci company lsp-haskell lsp-mode lsp-ui haskell-mode gruber-darker-theme smex))
 '(pdf-view-midnight-colors (cons "#839496" "#002b36"))
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(vc-annotate-background "#002b36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#859900")
    (cons 40 "#959300")
    (cons 60 "#a58e00")
    (cons 80 "#b58900")
    (cons 100 "#bc7407")
    (cons 120 "#c35f0e")
    (cons 140 "#cb4b16")
    (cons 160 "#cd4439")
    (cons 180 "#d03d5d")
    (cons 200 "#d33682")
    (cons 220 "#d63466")
    (cons 240 "#d9334a")
    (cons 260 "#dc322f")
    (cons 280 "#ba3f41")
    (cons 300 "#994d54")
    (cons 320 "#775b67")
    (cons 340 "#405A61")
    (cons 360 "#405A61")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_saves")))
