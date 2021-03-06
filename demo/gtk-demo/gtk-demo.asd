;;;; gtk-demo.lisp

(asdf:defsystem :gtk-demo
  :author "Dieter Kaiser"
  :license "LLGPL"
  :serial t
  :depends-on (:cl-cffi-gtk :split-sequence)
  :components ((:file "package")
               (:file "alignment")
               (:file "app-chooser-button")
               (:file "app-chooser-dialog")
               (:file "arrows")
               (:file "aspect-frame")
               (:file "application-window")
               (:file "assistant")
               (:file "box-packing")
               (:file "box-simple")
               (:file "button")
               (:file "button-box")
               (:file "buttons")
               (:file "calendar")
               (:file "clipboard")
               (:file "color-button")
               (:file "color-chooser-dialog")
               (:file "combo-box")
               (:file "combo-box-text")
               (:file "cursor")
               (:file "drag-and-drop")
               (:file "css-accordion")
               (:file "css-basics")
               (:file "css-blendmodes")
               (:file "css-pixbufs")
               (:file "dialog-alternative-order")
               (:file "dialog-toplevel")
               (:file "dialogs")
               (:file "drawing")
               (:file "entry-completion")
               (:file "entry-buffer")
               (:file "event-box")
               (:file "file-chooser-button")
               (:file "fixed")
               (:file "font-button")
               (:file "frame")
               (:file "grid")
               (:file "grid-packing")
               (:file "image")
               (:file "info-bar")
               (:file "labels")
               (:file "link-button")
;               (:file "listbox")
               (:file "menu")
               (:file "more-labels")
               (:file "notebook")
               (:file "numerable-icon")
               (:file "paned-window")
               (:file "pixbuf-scale")
               (:file "pixbufs")
               (:file "popover")
               (:file "printing")
               (:file "progress-bar")
               (:file "scale-widgets")
               (:file "scrolled-window")
               (:file "search-entry")
               (:file "selections-1")
               (:file "size-management")
               (:file "simple-application-window")
               (:file "simple-drag-and-drop")
               (:file "simple-file-chooser")
               (:file "simple-message")
               (:file "simple-text-view")
               (:file "simple-tree-view")
               (:file "simple-window")
               (:file "spin-button")
               (:file "statusbar")
               (:file "switch")
               (:file "table-packing")
               (:file "text-entry")
               (:file "text-view-attributes")
               (:file "toggle-buttons")
               (:file "tool-palette")
               (:file "gtk-demo")))
