with import <nixpkgs> {};
with pkgs.python310Packages;

let

  mutwo-core-archive = builtins.fetchTarball "https://github.com/mutwo-org/mutwo.core/archive/83efe12fb98119e03db833c231f9c87956577b3f.tar.gz";
  mutwo-core = import (mutwo-core-archive + "/default.nix");

  mutwo-music-archive = builtins.fetchTarball "https://github.com/mutwo-org/mutwo.music/archive/10c4f7f9fd4ec5d051b73dbffe2edd0628f9752f.tar.gz";
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
