;;; early-init.el --- Early init file -*- lexical-binding: t -*-

;; Hide UI chrome before the frame renders to avoid flicker
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-message t)

;; package.el is initialized explicitly in init.el
(setq package-enable-at-startup nil)

;;; early-init.el ends here.
