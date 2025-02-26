{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3Packages.dbus-python
    python3Packages.drawsvg
    python3Packages.geopy
    python3Packages.pygobject3
    python3Packages.requests
  ];
}
