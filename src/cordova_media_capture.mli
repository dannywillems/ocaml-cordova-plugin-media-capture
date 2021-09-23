(* -------------------------------------------------------------------------- *)
type error_type =
  | Internal_error [@js 0]
  | Application_busy [@js 1]
  | Invalid_argument [@js 2]
  | No_media_files [@js 3]
  | Capture_permission_denied [@js 4]
  | Not_supported [@js 20]
[@@js.enum]

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture_video_options :
  Ojs.t
  -> object
       inherit Ojs.obj

       method limit : int
       [@@js.get]

       method duration : int
       [@@js.get]
     end

(* -------------------------------------------------------------------------- *)
class capture_image_options :
  Ojs.t
  -> object
       inherit Ojs.obj

       method limit : int [@@js.get]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture_audio_options :
  Ojs.t
  -> object
       inherit Ojs.obj

       method limit : int
       [@@js.get]

       method duration : int
       [@@js.get]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class configuration_data :
  Ojs.t
  -> object
       inherit Ojs.obj

       method media_type : string
       [@@js.get]

       method height : int
       [@@js.get]

       method width : int
       [@@js.get]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class media_file_data :
  Ojs.t
  -> object
       inherit Ojs.obj

       method codecs : string
       [@@js.get]

       method bitrate : int
       [@@js.get]

       method height : int
       [@@js.get]

       method width : int
       [@@js.get]

       method duration : int
       [@@js.get]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture_error :
  Ojs.t
  -> object
       inherit Ojs.obj

       method code : error_type [@@js.get]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class media_file :
  Ojs.t
  -> object
       inherit Ojs.obj

       method name : string
       [@@js.get]

       method full_path : string
       [@@js.get]

       method media_type : string
       [@@js.get]

       method last_modified_date : string
       [@@js.get]

       method size : int
       [@@js.get]

       method get_format_data :
         (media_file_data -> unit) ->
         ?err_cb:(capture_error -> unit) ->
         unit ->
         unit
       [@@js.call]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture :
  Ojs.t
  -> object
       inherit Ojs.obj

       method capture_video :
         (media_file array -> unit) ->
         (capture_error -> unit) ->
         ?opt:capture_video_options ->
         unit ->
         unit
       [@@js.call]

       method capture_image :
         (media_file array -> unit) ->
         (capture_error -> unit) ->
         ?opt:capture_image_options ->
         unit ->
         unit
       [@@js.call]

       method capture_audio :
         (media_file array -> unit) ->
         (capture_error -> unit) ->
         ?opt:capture_audio_options ->
         unit ->
         unit
       [@@js.call]
     end

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> capture [@@js.get "navigator.device.capture"]

(* -------------------------------------------------------------------------- *)
