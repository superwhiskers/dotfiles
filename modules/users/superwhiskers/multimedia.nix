# multimedia.nix - configuration of multimedia applications
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

{ config, pkgs, lib, ... }: {
  # enable the mpv media player
  programs.mpv = {
    enable = true;
    config = {
      ytdl-format =
        "((bestvideo[vcodec^=vp9]/bestvideo)+(bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio))/best";
      sub-auto = "fuzzy";
      ytdl-raw-options = "write-auto-sub=,write-sub=,sub-lang=en";
      vo = "gpu";
    };
    scripts = lib.attrVals [ "sponsorblock" ] pkgs.mpvScripts;
  };

  # enable the beets music library manager
  programs.beets = {
    enable = true;
    package = (pkgs.beets.overrideAttrs (oldAttrs: {
      propagatedBuildInputs = lib.attrVals [ "pillow" ] pkgs.python39Packages
        ++ oldAttrs.propagatedBuildInputs;
    })).override { pythonPackages = pkgs.python39Packages; };
    settings = {
      directory = config.xdg.userDirs.music;
      library = "${config.xdg.userDirs.music}/musiclibrary.db";
      plugins = [ "embedart" "fetchart" "thumbnails" ];
    };
  };
}
