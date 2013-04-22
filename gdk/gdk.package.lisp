;;; ----------------------------------------------------------------------------
;;; gdk.package.lisp
;;;
;;; The documentation has been copied from the GDK 3 Reference Manual
;;; Version 3.6.4. See <http://www.gtk.org>. The API documentation of the
;;; Lisp binding is available at <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2013 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------

(declaim #+sbcl(sb-ext:muffle-conditions style-warning))

(defpackage :gdk
  (:use :gdk-pixbuf :gobject :glib :gio :cffi :pango :cairo :iter :cl))

(in-package :gdk)

#+cl-cffi-gtk-documentation
(setf (documentation (find-package :gdk) t)
 "GDK is an intermediate layer which isolates GTK+ from the details of the
  windowing system.
  This is the API documentation of a Lisp binding to GDK.
  @begin[General]{section}
    This section describes the GDK initialization functions and miscellaneous
    utility functions, as well as deprecation facilities.

    GDK and GTK+ provide support for building applications against defined
    subsets of deprecated or new APIs. Define the macro
    @code{GDK_VERSION_MIN_REQUIRED} to specify up to what version you want to
    receive warnings about deprecated APIs. Define the macro
    @code{GDK_VERSION_MAX_ALLOWED} to specify the newest version whose API you
    want to use.

    @about-function{gdk-init}
    @about-function{gdk-init-check}
    @about-function{gdk-parse-args}
    @about-function{gdk-get-display-arg-name}
    @about-function{gdk-notify-startup-complete}
    @about-function{gdk-notify-startup-complete-with-id}
    @about-function{gdk-get-program-class}
    @about-function{gdk-set-program-class}
    @about-function{gdk-get-display}
    @about-function{gdk-flush}
    @about-function{gdk-screen-width}
    @about-function{gdk-screen-height}
    @about-function{gdk-screen-width-mm}
    @about-function{gdk-screen-height-mm}
    @about-function{gdk-pointer-grab}
    @about-symbol{gdk-grab-status}
    @about-function{gdk-pointer-ungrab}
    @about-function{gdk-pointer-is-grabbed}
    @about-function{gdk-set-double-click-time}
    @about-function{gdk-keyboard-grab}
    @about-function{gdk-keyboard-ungrab}
    @about-function{gdk-beep}
    @about-function{gdk-error-trap-push}
    @about-function{gdk-error-trap-pop}
    @about-function{gdk-error-trap-pop-ignored}
    @about-symbol{GDK_WINDOWING_X11}
    @about-symbol{GDK_WINDOWING_WIN32}
    @about-symbol{GDK_VERSION_3_0}
    @about-symbol{GDK_VERSION_3_2}
    @about-symbol{GDK_VERSION_3_4}
    @about-symbol{GDK_VERSION_MIN_REQUIRED}
    @about-symbol{GDK_VERSION_MAX_ALLOWED}
  @end{section}
  @begin[GdkDisplayManager]{section}
    Maintains a list of all open GdkDisplays.

    @about-class{gdk-display-manager}
    @about-function{gdk-display-manager-get}
    @about-function{gdk-display-manager-get-default-display}
    @about-function{gdk-display-manager-set-default-display}
    @about-function{gdk-display-manager-list-displays}
    @about-function{gdk-display-manager-open-display}
  @end{section}
  @begin[GdkDisplay]{section}
    Controls a set of GdkScreens and their associated input devices.

    @about-class{gdk-display}
    @about-function{gdk-display-open}
    @about-function{gdk-display-get-default}
    @about-function{gdk-display-get-name}
    @about-function{gdk-display-get-n-screens}
    @about-function{gdk-display-get-screen}
    @about-function{gdk-display-get-default-screen}
    @about-function{gdk-display-get-device-manager}
    @about-function{gdk-display-pointer-ungrab}
    @about-function{gdk-display-keyboard-ungrab}
    @about-function{gdk-display-pointer-is-grabbed}
    @about-function{gdk-display-device-is-grabbed}
    @about-function{gdk-display-beep}
    @about-function{gdk-display-sync}
    @about-function{gdk-display-flush}
    @about-function{gdk-display-close}
    @about-function{gdk-display-is-closed}
    @about-function{gdk-display-get-event}
    @about-function{gdk-display-peek-event}
    @about-function{gdk-display-put-event}
    @about-function{gdk-display-has-pending}
    @about-function{gdk-display-set-double-click-time}
    @about-function{gdk-display-set-double-click-distance}
    @about-function{gdk-display-get-pointer}
    @about-function{gdk-display-list-devices}
    @about-function{gdk-display-get-window-at-pointer}
    @about-function{gdk-display-warp-pointer}
    @about-function{gdk-display-supports-cursor-color}
    @about-function{gdk-display-supports-cursor-alpha}
    @about-function{gdk-display-get-default-cursor-size}
    @about-function{gdk-display-get-maximal-cursor-size}
    @about-function{gdk-display-get-default-group}
    @about-function{gdk-display-supports-selection-notification}
    @about-function{gdk-display-request-selection-notification}
    @about-function{gdk-display-supports-clipboard-persistence}
    @about-function{gdk-display-store-clipboard}
    @about-function{gdk-display-supports-shapes}
    @about-function{gdk-display-supports-input-shapes}
    @about-function{gdk-display-supports-composite}
    @about-function{gdk-display-get-app-launch-context}
    @about-function{gdk-display-notify-startup-complete}
  @end{section}
  @begin[GdkScreen]{section}
    Object representing a physical screen.

    @about-class{gdk-screen}
    @about-function{gdk-screen-get-default}
    @about-function{gdk-screen-get-system-visual}
    @about-function{gdk-screen-get-rgba-visual}
    @about-function{gdk-screen-is-composited}
    @about-function{gdk-screen-get-root-window}
    @about-function{gdk-screen-get-display}
    @about-function{gdk-screen-get-number}
    @about-function{gdk-screen-get-width}
    @about-function{gdk-screen-get-height}
    @about-function{gdk-screen-get-width-mm}
    @about-function{gdk-screen-get-height-mm}
    @about-function{gdk-screen-list-visuals}
    @about-function{gdk-screen-get-toplevel-windows}
    @about-function{gdk-screen-make-display-name}
    @about-function{gdk-screen-get-n-monitors}
    @about-function{gdk-screen-get-primary-monitor}
    @about-function{gdk-screen-get-monitor-geometry}
    @about-function{gdk-screen-get-monitor-workarea}
    @about-function{gdk-screen-get-monitor-at-point}
    @about-function{gdk-screen-get-monitor-at-window}
    @about-function{gdk-screen-get-monitor-height-mm}
    @about-function{gdk-screen-get-monitor-width-mm}
    @about-function{gdk-screen-get-monitor-plug-name}
    @about-function{gdk-screen-get-setting}
    @about-function{gdk-screen-get-font-options}
    @about-function{gdk-screen-set-font-options}
    @about-function{gdk-screen-get-resolution}
    @about-function{gdk-screen-set-resolution}
    @about-function{gdk-screen-get-active-window}
    @about-function{gdk-screen-get-window-stack}
  @end{section}
  @begin[GdkDeviceManager]{section}
    Functions for handling input devices.

    @about-class{gdk-device-manager}
    @about-function{gdk-disable-multidevice}
    @about-function{gdk-device-manager-get-display}
    @about-function{gdk-device-manager-list-devices}
    @about-function{gdk-device-manager-get-client-pointer}
  @end{section}
  @begin[GdkDevice]{section}
    Object representing an input device
  @end{section}
  @begin[Points and Rectangles]{section}
    Simple graphical data types.

    GDK provides the @class{gdk-point} and @class{gdk-rectangle} data types for
    representing pixels and sets of pixels on the screen. Together with Cairo's
    @symbol{cairo-region-t} data type, they make up the central types for
    representing graphical data.

    @about-struct{gdk-point}
    @about-struct{gdk-rectangle}
    @about-function{gdk-rectangle-intersect}
    @about-function{gdk-rectangle-union}
  @end{section}
  @begin[Pixbufs]{section}
    Functions for obtaining pixbufs
  @end{section}
  @begin[Colors]{section}
    Manipulation of colors

    @about-struct{gdk-color}
    @about-function{gdk-color-copy}
    @about-function{gdk-color-free}
    @about-function{gdk-color-parse}
    @about-function{gdk-color-equal}
    @about-function{gdk-color-hash}
    @about-function{gdk-color-to-string}
  @end{section}
  @begin[RGBA Colors]{section}
    RGBA colors
  @end{section}
  @begin[Visuals]{section}
    Low-level display hardware information
  @end{section}
  @begin[Cursors]{section}
    Standard and pixmap cursors.

    @about-class{gdk-cursor}
    @about-symbol{gdk-cursor-type}
    @about-function{gdk-cursor-new}
    @about-function{gdk-cursor-new-from-pixbuf}
    @about-function{gdk-cursor-new-from-name}
    @about-function{gdk-cursor-new-for-display}
    @about-function{gdk-cursor-get-display}
    @about-function{gdk-cursor-get-image}
    @about-function{gdk-cursor-get-cursor-type}
    @about-function{gdk-cursor-ref}
    @about-function{gdk-cursor-unref}
  @end{section}
  @begin[Windows]{section}
    Onscreen display areas in the target window system.

    @about-class{gdk-window}
    @about-symbol{gdk-window-type}
    @about-symbol{gdk-window-window-class}
    @about-symbol{gdk-window-hints}
    @about-symbol{gdk-geometry}
    @about-symbol{gdk-gravity}
    @about-symbol{gdk-window-edge}
    @about-symbol{gdk-window-type-hint}
    @about-symbol{gdk-window-attr}
    @about-symbol{gdk-window-attributes-type}
    @about-function{gdk-window-new}
    @about-function{gdk-window-destroy}
    @about-function{gdk-window-get-window-type}
    @about-function{gdk-window-get-display}
    @about-function{gdk-window-get-screen}
    @about-function{gdk-window-get-visual}
    @about-function{gdk-window-at-pointer}
    @about-function{gdk-window-show}
    @about-function{gdk-window-show-unraised}
    @about-function{gdk-window-hide}
    @about-function{gdk-window-is-destroyed}
    @about-function{gdk-window-is-visible}
    @about-function{gdk-window-is-viewable}
    @about-function{gdk-window-is-input-only}
    @about-function{gdk-window-is-shaped}
    @about-function{gdk-window-get-state}
    @about-function{gdk-window-withdraw}
    @about-function{gdk-window-iconify}
    @about-function{gdk-window-deiconify}
    @about-function{gdk-window-stick}
    @about-function{gdk-window-unstick}
    @about-function{gdk-window-maximize}
    @about-function{gdk-window-unmaximize}
    @about-function{gdk-window-fullscreen}
    @about-function{gdk-window-unfullscreen}
    @about-function{gdk-window-set-keep-above}
    @about-function{gdk-window-set-keep-below}
    @about-function{gdk-window-set-opacity}
    @about-function{gdk-window-set-composited}
    @about-function{gdk-window-get-composited}
    @about-function{gdk-window-move}
    @about-function{gdk-window-resize}
    @about-function{gdk-window-move-resize}
    @about-function{gdk-window-scroll}
    @about-function{gdk-window-move-region}
    @about-function{gdk-window-flush}
    @about-function{gdk-window-has-native}
    @about-function{gdk-window-ensure-native}
    @about-function{gdk-window-reparent}
    @about-function{gdk-window-raise}
    @about-function{gdk-window-lower}
    @about-function{gdk-window-restack}
    @about-function{gdk-window-focus}
    @about-function{gdk-window-register-dnd}
    @about-function{gdk-window-begin-resize-drag}
    @about-function{gdk-window-begin-resize-drag-for-device}
    @about-function{gdk-window-begin-move-drag}
    @about-function{gdk-window-begin-move-drag-for-device}
    @about-function{gdk-window-constrain-size}
    @about-function{gdk-window-beep}
    @about-function{gdk-window-get-clip-region}
    @about-function{gdk-window-begin-paint-rect}
    @about-function{gdk-window-begin-paint-region}
    @about-function{gdk-window-end-paint}
    @about-function{gdk-window-get-visible-region}
    @about-function{gdk-window-invalidate-rect}
    @about-function{gdk-window-invalidate-region}
    @about-function{gdk-window-invalidate-maybe-recurse}
    @about-function{gdk-window-get-update-area}
    @about-function{gdk-window-freeze-updates}
    @about-function{gdk-window-thaw-updates}
    @about-function{gdk-window-process-all-updates}
    @about-function{gdk-window-process-updates}
    @about-function{gdk-window-set-debug-updates}
    @about-function{gdk-window-enable-synchronized-configure}
    @about-function{gdk-window-configure-finished}
    @about-function{gdk-window-set-user-data}
    @about-function{gdk-window-set-override-redirect}
    @about-function{gdk-window-set-accept-focus}
    @about-function{gdk-window-get-accept-focus}
    @about-function{gdk-window-set-focus-on-map}
    @about-function{gdk-window-get-focus-on-map}
    @about-function{gdk-window-add-filter}
    @about-function{gdk-window-remove-filter}
    @about-symbol{gdk-filter-return}
    @about-symbol{gdk-x-event}
    @about-function{gdk-window-shape-combine-region}
    @about-function{gdk-window-set-child-shapes}
    @about-function{gdk-window-merge-child-shapes}
    @about-function{gdk-window-input-shape-combine-region}
    @about-function{gdk-window-set-child-input-shapes}
    @about-function{gdk-window-merge-child-input-shapes}
    @about-function{gdk-window-set-static-gravities}
    @about-function{gdk-window-set-title}
    @about-function{gdk-window-set-background}
    @about-function{gdk-window-set-background-rgba}
    @about-function{gdk-window-set-background-pattern}
    @about-function{gdk-window-get-background-patter}
    @about-symbol{GDK-PARENT-RELATIVE}
    @about-function{gdk-window-get-user-data}
    @about-function{gdk-window-get-geometry}
    @about-function{gdk-window-set-geometry-hints}
    @about-function{gdk-window-get-width}
    @about-function{gdk-window-get-height}
    @about-function{gdk-window-set-icon-list}
    @about-function{gdk-window-set-modal-hint}
    @about-function{gdk-window-get-modal-hint}
    @about-function{gdk-window-set-type-hint}
    @about-function{gdk-window-get-type-hint}
    @about-function{gdk-window-set-skip-taskbar-hint}
    @about-function{gdk-window-set-skip-pager-hint}
    @about-function{gdk-window-set-urgency-hint}
    @about-function{gdk-window-get-position}
    @about-function{gdk-window-get-root-origin}
    @about-function{gdk-window-get-frame-extents}
    @about-function{gdk-window-get-origin}
    @about-function{gdk-window-get-root-coords}
    @about-function{gdk-window-get-pointer}
    @about-function{gdk-window-get-device-position}
    @about-symbol{GdkModifierType}
    @about-function{gdk-window-get-parent}
    @about-function{gdk-window-get-toplevel}
    @about-function{gdk-window-get-children}
    @about-function{gdk-window-peek-children}
    @about-function{gdk-window-get-events}
    @about-function{gdk-window-set-events}
    @about-function{gdk-window-set-icon-name}
    @about-function{gdk-window-set-transient-for}
    @about-function{gdk-window-set-role}
    @about-function{gdk-window-set-startup-id}
    @about-function{gdk-window-set-group}
    @about-function{gdk-window-get-group}
    @about-function{gdk-window-set-decorations}
    @about-function{gdk-window-get-decorations}
    @about-symbol{GdkWMDecoration}
    @about-function{gdk-window-set-functions}
    @about-symbol{GdkWMFunction}
    @about-function{gdk-get-default-root-window}
    @about-function{gdk-window-get-support-multidevice}
    @about-function{gdk-window-set-support-multidevice}
    @about-function{gdk-window-get-device-cursor}
    @about-function{gdk-window-set-device-cursor}
    @about-function{gdk-window-get-device-events}
    @about-function{gdk-window-set-device-events}
    @about-function{gdk-window-get-source-events}
    @about-function{gdk-window-set-source-events}
    @about-function{gdk-offscreen-window-get-surface}
    @about-function{gdk-offscreen-window-set-embedder}
    @about-function{gdk-offscreen-window-get-embedder}
    @about-function{gdk-window-geometry-changed}
    @about-function{gdk-window-coords-from-parent}
    @about-function{gdk-window-coords-to-parent}
    @about-function{gdk-window-get-effective-parent}
    @about-function{gdk-window-get-effective-toplevel}
  @end{section}
  @begin[Events]{section}
    Functions for handling events from the window system
  @end{section}
  @begin[Event Structures]{section}
    The event structs contain data specific to each type of event in GDK.

    @subheading{Note}
      A common mistake is to forget to set the event mask of a widget so that
      the required events are received. See @fun{gtk-widget-set-events}.

    @about-symbol{gdk-scroll-direction}
    @about-symbol{gdk-visibility-state}
    @about-symbol{gdk-crossing-mode}
    @about-symbol{gdk-notify-type}
    @about-symbol{gdk-property-state}
    @about-symbol{gdk-window-state}
    @about-symbol{gdk-setting-action}
    @about-symbol{gdk-owner-change}
    @about-symbol{gdk-event-type}
    @about-symbol{gdk-modifier-type}
    @about-symbol{gdk-event-mask}
    @about-class{gdk-event}
    @about-class{gdk-event-any}
    @about-class{gdk-event-expose}
    @about-class{gdk-event-visibility}
    @about-class{gdk-event-motion}
    @about-class{gdk-event-touch}
    @about-class{gdk-event-scroll}
    @about-class{gdk-event-key}
    @about-class{gdk-event-crossing}
    @about-class{gdk-event-focus}
    @about-class{gdk-event-configure}
    @about-class{gdk-event-property}
    @about-class{gdk-event-selection}
    @about-class{gdk-event-owner-change}
    @about-class{gdk-event-proximity}
    @about-class{gdk-event-dnd}
    @about-class{gdk-event-window-state}
    @about-class{gdk-event-setting}
    @about-class{gdk-event-grab-broken}
  @end{section}
  @begin[Key Values]{section}
    Functions for manipulating keyboard codes
  @end{section}
  @begin[Selections]{section}
    Functions for transfering data via the X selection mechanism.

    The X selection mechanism provides a way to transfer arbitrary chunks of
    data between programs. A selection is a essentially a named clipboard,
    identified by a string interned as a @symol{gdk-atom}. By claiming ownership
    of a selection, an application indicates that it will be responsible for
    supplying its contents. The most common selections are \"PRIMARY\" and
    \"CLIPBOARD\".

    The contents of a selection can be represented in a number of formats,
    called targets. Each target is identified by an atom. A list of all possible
    targets supported by the selection owner can be retrieved by requesting the
    special target \"TARGETS\". When a selection is retrieved, the data is
    accompanied by a type (an atom), and a format (an integer, representing the
    number of bits per item). See Properties and Atoms for more information.

    The functions in this section only contain the lowlevel parts of the
    selection protocol. A considerably more complicated implementation is needed
    on top of this. GTK+ contains such an implementation in the functions in
    @code{gtkselection.h} and programmers should use those functions instead of
    the ones presented here. If you plan to implement selection handling
    directly on top of the functions here, you should refer to the X
    Inter-client Communication Conventions Manual (ICCCM).

    @about-function{gdk-selection-owner-set}
    @about-function{gdk-selection-owner-set-for-display}
    @about-function{gdk-selection-owner-get}
    @about-function{gdk-selection-owner-get-for-display}
    @about-function{gdk-selection-convert}
    @about-function{gdk-selection-property-get}
    @about-function{gdk-selection-send-notify}
    @about-function{gdk-selection-send-notify-for-display}
  @end{section}
  @begin[Drag And Drop]{section}
    Functions for controlling drag and drop handling.

    @about-symbol{gdk-drag-protocol}
    @about-symbol{gdk-drag-action}
    @about-class{gdk-drag-context}
    @about-function{gdk-drag-get-selection}
    @about-function{gdk-drag-abort}
    @about-function{gdk-drop-reply}
    @about-function{gdk-drag-drop}
    @about-function{gdk-drag-find-window-for-screen}
    @about-function{gdk-drag-begin}
    @about-function{gdk-drag-begin-for-device}
    @about-function{gdk-drag-motion}
    @about-function{gdk-drop-finish}
    @about-function{gdk-drag-status}
    @about-function{gdk-drag-drop-succeeded}
    @about-function{gdk-window-get-drag-protocol}
    @about-function{gdk-drag-context-get-actions}
    @about-function{gdk-drag-context-get-suggested-action}
    @about-function{gdk-drag-context-get-selected-action}
    @about-function{gdk-drag-context-list-targets}
    @about-function{gdk-drag-context-get-device}
    @about-function{gdk-drag-context-set-device}
    @about-function{gdk-drag-context-get-source-window}
    @about-function{gdk-drag-context-get-dest-window}
    @about-function{gdk-drag-context-get-protocol}
  @end{section}
  @begin[Properties and Atoms]{section}
    Functions to manipulate properties on windows.

    @about-symbol{gdk-atom}
    @about-symbol{GDK_ATOM_TO_POINTER}
    @about-symbol{GDK_POINTER_TO_ATOM}
    @about-symbol{GDK_NONE}
    @about-function{gdk-text-property-to-utf8-list-for-display}
    @about-function{gdk-utf8-to-string-target}
    @about-function{gdk-atom-intern}
    @about-function{gdk-atom-intern-static-string}
    @about-function{gdk-atom-name}
    @about-function{gdk-property-get}
    @about-function{gdk-property-change}
    @about-symbol{GdkPropMode}
    @about-function{gdk-property-delete}
  @end{section}
  @begin[Threads]{section}
    Functions for using GDK in multi-threaded programs
  @end{section}
  @begin[Pango Interaction]{section}
    Using Pango in GDK
  @end{section}
  @begin[Cairo Interaction]{section}
    Functions to support using cairo
  @end{section}
  @begin[X Window System Interaction]{section}
    X backend-specific functions
  @end{section}
  @begin[Application launching]{section}
    Startup notification for applications.

    @about-class{gdk-app-launch-context}
    @about-function{gdk-app-launch-context-new}
    @about-function{gdk-app-launch-context-set-display}
    @about-function{gdk-app-launch-context-set-screen}
    @about-function{gdk-app-launch-context-set-desktop}
    @about-function{gdk-app-launch-context-set-timestamp}
    @about-function{gdk-app-launch-context-set-icon}
    @about-function{gdk-app-launch-context-set-icon-name}
  @end{section}
 ")

;;; --- End of file gdk.package.lisp -------------------------------------------
