(with-eval-after-load 'emms
  (require 'emms-source-file)
  (require 'emms-player-mplayer)
  ;; (emms-player-set
  ;;  emms-player-mpv 'regex
  ;;  (concat "\\(https\\)\\|" (emms-player-get emms-player-mpv 'regex)))
  ;; (add-to-list 'emms-player-mpv-parameters "--ytdl-format=best[height<=480]")
  (setq emms-playlist-buffer-name "*EMMS Playlist*")
  (add-to-list 'emms-player-list 'emms-player-mplayer))
(with-eval-after-load 'face-remap
  (defadvice text-scale-increase (around all-buffers (arg) activate)
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        ad-do-it))))
