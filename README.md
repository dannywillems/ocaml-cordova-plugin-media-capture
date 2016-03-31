# ocaml-cordova-plugin-media-capture

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

## How to use ?

TODO

## ! BE CAREFUL !

The plugin creates a new object called *navigator.device.capture*, but the object is
available when the *deviceready* event is handled.

We provide a function *Media_capture.t* of type *unit -> Media_capture.capture* which creates the
binding to the *navigator.device.capture* js object. You must call it when the deviceready
event is handled, eg (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let media-capture = Media_capture.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
