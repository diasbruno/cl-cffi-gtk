(defpackage :gtk-example
  (:use :gtk :gdk :gdk-pixbuf :gobject
   :glib :gio :pango :cairo :cffi :common-lisp)
  (:export #:example-dialog
           #:example-dialog-new
           #:example-dialog-new-with-buttons
           #:example-dialog-ui
           #:example-file-chooser-dialog
           #:example-grab
           #:example-grid-packing
           #:example-image-button-press
           #:example-image-menu-item
           #:example-info-bar
           #:example-level-bar
           #:example-menu-builder
           #:example-message-dialog-get-message-area
           #:example-message-dialog-new
           #:example-message-dialog-new-with-markup
           #:example-message-dialog-set-image
           #:example-message-dialog-set-markup
           #:example-message-dialog-ui
           #:example-page-setup-unix-dialog
           #:example-pointer-device
           #:example-print-dialog
           #:example-print-operation
           #:example-print-run-page-setup-dialog
           #:example-print-run-page-setup-dialog-async
           #:example-radio-button
           #:example-show-about-dialog
           #:example-simple-list-store
           #:example-widget-pointer
           #:simple-application
           ))

(in-package :gtk-example)

(defun rel-path (filename)
  (let ((system-path (asdf:system-source-directory :gtk-example)))
    (princ-to-string (merge-pathnames filename system-path))))

