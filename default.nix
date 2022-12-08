with import <nixpkgs> {};
with pkgs.python310Packages;

let

  mutwo-music-archive = builtins.fetchTarball "https://github.com/mutwo-org/mutwo.music/archive/929ec3faadd6426356d27df9614143e641be745d.tar.gz";
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
      mutwo-music
    ];
    checkPhase = ''
      runHook preCheck
      pytest
      runHook postCheck
    '';
    doCheck = true;
  }
