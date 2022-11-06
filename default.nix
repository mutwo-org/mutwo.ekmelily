with import <nixpkgs> {};
with pkgs.python310Packages;

let

  mutwo-core-archive = builtins.fetchTarball "https://github.com/mutwo-org/mutwo.core/archive/61ebb657ef5806eb067f5df6885254fdbae8f44c.tar.gz";
  mutwo-core = import (mutwo-core-archive + "/default.nix");

  mutwo-music-archive = builtins.fetchTarball "https://github.com/mutwo-org/mutwo.music/archive/d90b6db7d433d64c25f039adcd6b41075c05c013.tar.gz";
  mutwo-music = import (mutwo-music-archive + "/default.nix");

in

  buildPythonPackage rec {
    name = "mutwo.ekmelily";
    src = fetchFromGitHub {
      owner = "mutwo-org";
      repo = name;
      rev = "23331d320fa3957eeac0c12d1b664ad8c3265087";
      sha256 = "sha256-zg0sGbKVGCr0EfgU74FrNP66ljgPB/wVA0Kf4g/aaqQ=";
    };
    checkInputs = [
      python310Packages.pytest
    ];
    propagatedBuildInputs = [
      mutwo-core
      mutwo-music
    ];
    checkPhase = ''
      runHook preCheck
      pytest
      runHook postCheck
    '';
    doCheck = true;
  }
