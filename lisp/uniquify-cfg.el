;; uniquify - better unique buffer names like foo|bar and foo|baz
;;
;; name-styles:
;;
;; VALUE	                1ST "NAME"        SECOND BUFFER CALLED "NAME"
;; forward	                bar/mumble/name   quux/mumble/name
;; reverse	                name\mumble\bar   name\mumble\quux
;; post-forward                 name|bar/mumble   name|quux/mumble
;; post-forward-angle-brackets  name<bar/mumble>  name<quux/mumble>
;; nil                          name              name<2>
(use-package uniquify
  :config
  (setq
   uniquify-buffer-name-style 'post-forward
   uniquify-separator "|"
   uniquify-after-kill-buffer-p t      ;rename after killing buffers
   uniquify-ignore-buffers-re "^\\*"   ;leave special buffers alone
   )
  )