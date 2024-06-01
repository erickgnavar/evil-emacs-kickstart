(setq inhibit-startup-message t)
(setq default-directory (expand-file-name "~/"))

;; Change backups directory to emacs folder
;; this avoid to save backup files in the same directory of the original files
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; Revert dired and other buffers when there are changes on disk
(setq global-auto-revert-non-file-buffers t)

;; Hide the bell in the center of screen
(setq ring-bell-function 'ignore)

(column-number-mode nil)

;; highlight current line
(global-hl-line-mode 1)

;; Navigate through buffers
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;; Fix unicode errors
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

;; dark theme
(load-theme 'modus-vivendi)

;; Fix size of scroll
(setq scroll-step 1
      scroll-conservatively  10000)

;; Avoid close emacs by mistake
(global-unset-key (kbd "C-x C-c"))

(defalias 'yes-or-no-p 'y-or-n-p)

;; place custom code generated for emacs in a separate file
(defconst custom-file (expand-file-name ".customize.el" user-emacs-directory))
(load custom-file :noerror)

;; Initialize package manager, this is required to be able to add
;; MELPA repositories
(package-initialize)

(add-to-list 'package-archives  '("MELPA" . "http://melpa.org/packages/"))

;; Use vim keybindings globally
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-leader '(normal visual) (kbd "SPC"))
  ;; show a list of available interactive functions
  (evil-define-key 'normal 'global (kbd "<leader>SPC") #'(lambda ()
                                                           (interactive)
                                                           (call-interactively #'execute-extended-command)))
  (evil-define-key nil 'global (kbd "<leader>a") 'consult-ripgrep)
  ;; find in project using fuzzy search
  (evil-define-key nil 'global (kbd "<leader>e") 'project-find-file)
  (evil-define-key nil 'global (kbd "<leader>f") 'find-file)
  (evil-define-key nil 'global (kbd "<leader>k") 'kill-buffer)
  ;; toggle native line numbers
  (evil-define-key nil 'global (kbd "<leader>l") 'display-line-numbers-mode)
  (evil-define-key nil 'global (kbd "<leader>n") 'evil-buffer-new)
  ;; fuzzy search for current buffer content
  (evil-define-key nil 'global (kbd "<leader>q") 'consult-line)
  (evil-define-key nil 'global (kbd "<leader>y") 'consult-yank-from-kill-ring))

;; A pretty modeline with useful information
(use-package doom-modeline
  :ensure t
  :defer t
  :custom
  ;; show evil state in modeline
  (doom-modeline-modal-icon nil)
  ;; file path will be relative to project root
  (doom-modeline-buffer-file-name-style 'relative-from-project)
  :hook
  (after-init . doom-modeline-mode)
  (doom-modeline-mode . display-battery-mode))

;; Show markers about version control status for the current file
(use-package diff-hl
  :ensure t
  :custom
  ;; if a hunk was already staged it won't show a marker
  (diff-hl-show-staged-changes nil)
  :init
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  :config
  (global-diff-hl-mode))

(use-package evil-matchit
  :ensure t
  :config (global-evil-matchit-mode 1))

(use-package evil-nerd-commenter
  :ensure t
  :after (evil)
  :config
  ;; auto configure hotkeys for evil mode and not for emacs
  (evilnc-default-hotkeys nil t)
  ;; avoid to auto-setup of keybindings
  (setq evilnc-use-comment-object-setup nil))

(use-package markdown-mode
  :ensure t
  :defer t)

;; add pair parenthesis, square brackets, etc
(add-hook 'prog-mode-hook 'electric-pair-mode)

;; disable `electric-pair-mode' in `org-mode', to avoid conflict with
;; `<s' source block
(add-hook 'org-mode-hook #'(lambda ()
                             (electric-pair-local-mode -1)))

(use-package consult
  :ensure t)

;; Show a marker in fringe area when there is a change in the current
;; buffer
(use-package diff-hl
  :ensure t
  :custom
  (diff-hl-show-staged-changes nil)
  :init
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  :config
  (global-diff-hl-mode))

;; UI for completion
(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :custom
  ;; fixed height
  (vertico-resize nil)
  ;; show max 15 elements
  (vertico-count 15))

;; Enhance information in completion
(use-package marginalia
  :ensure
  :init
  (marginalia-mode))

;; Better completion style
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion)))))

;; Show help about the keys pressed
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-minibuffer))

;; Completion at point support
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.1
        company-tooltip-limit 10
        company-minimum-prefix-length 3)
  :hook (after-init . global-company-mode)
  :config
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;;; init.el ends here.
