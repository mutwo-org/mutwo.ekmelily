let
  sourcesTarball = fetchTarball "https://github.com/mutwo-org/mutwo-nix/archive/refs/heads/main.tar.gz";
  mutwo-ekmelily = import (sourcesTarball + "/mutwo.ekmelily/default.nix") {};
  mutwo-ekmelily-local = mutwo-ekmelily.overrideAttrs (
    finalAttrs: previousAttrs: {
       src = ./.;
    }
  );
in
  mutwo-ekmelily-local
