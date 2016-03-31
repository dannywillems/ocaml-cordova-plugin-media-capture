(* -------------------------------------------------------------------------- *)
type error_type =
  | Internal_error [@js 0]
  | Application_busy [@js 1]
  | Invalid_argument [@js 2]
  | No_media_files [@js 3]
  | Not_supported [@js 20]
  [@@js.enum]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture_video_options : Ojs.t ->
  object
    inherit Ojs.obj
    method limit          : int
    method duration       : int
  end

(* -------------------------------------------------------------------------- *)
class capture_image_options : Ojs.t ->
  object
    inherit Ojs.obj
    method limit          : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture_audio_options : Ojs.t ->
  object
    inherit Ojs.obj
    method limit          : int
    method duration       : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class configuration_data : Ojs.t ->
  object
    inherit Ojs.obj
    method media_type         : string
    method height             : int
    method width              : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class media_file_data : Ojs.t ->
  object
    inherit Ojs.obj
    method codecs             : string
    method bitrate            : int
    method height             : int
    method width              : int
    method duration           : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture_error : Ojs.t ->
  object
    inherit Ojs.obj
    method code : error_type
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class media_file : Ojs.t ->
  object
    inherit Ojs.obj
    method name               : string
    method full_path          : string
    method media_type         : string
    method last_modified_date : string
    method size               : int
    method get_format_data    : (media_file_data -> unit)       ->
                                ?err_cb:(capture_error -> unit) ->
                                unit                            ->
                                unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class capture : Ojs.t ->
  object
    inherit Ojs.obj

    method capture_video  : (media_file array -> unit)  ->
                            (capture_error -> unit)     ->
                            ?opt:capture_video_options  ->
                            unit                        ->
                            unit

    method capture_image  : (media_file array -> unit)  ->
                            (capture_error -> unit)     ->
                            ?opt:capture_image_options  ->
                            unit                        ->
                            unit

    method capture_audio  : (media_file array -> unit)  ->
                            (capture_error -> unit)     ->
                            ?opt:capture_audio_options  ->
                            unit                        ->
                            unit

  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> capture
[@@js.get "navigator.device.capture"]
(* -------------------------------------------------------------------------- *)

