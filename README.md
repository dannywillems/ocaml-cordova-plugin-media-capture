# ocaml-cordova-plugin-media-capture

* gen_js_api (master branch): [![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-media-capture.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-media-capture)

Binding to
[cordova-plugin-media-capture](https://github.com/apache/cordova-plugin-media-capture)

## What does cordova-plugin-media-capture do ?

```
This plugin provides access to the device's audio, image, and video capture
capabilities.
```

Source: [cordova-plugin-media-capture](https://github.com/apache/cordova-plugin-media-capture)

## Repository branches and tags

Only gen_js_api version is provided.

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-media-capture https://github.com/dannywillems/ocaml-cordova-plugin-media-capture.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-media-capture [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin media capture with
```Shell
cordova plugin add cordova-plugin-media-capture
```

## How to use ?

See the official documentation:
[cordova-plugin-media-capture](https://github.com/apache/cordova-plugin-media-capture)

## ! BE CAREFUL !

The plugin creates a new object called *navigator.device.capture*, but the object is
available when the *deviceready* event is handled.

We provide a function *Cordova_media_capture.t* of type *unit -> Cordova_media_capture.capture* which creates the
binding to the *navigator.device.capture* js object. You must call it when the deviceready
event is handled, eg (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let t = Cordova_media_capture.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
