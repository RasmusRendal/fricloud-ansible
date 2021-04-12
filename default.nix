with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "fricloud-ansible";
  src = ./.;

  buildInputs = [ ansible_2_9 ];

}
