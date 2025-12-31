{ pkgs, background ? null, font ? "SF Pro Rounded" }:

pkgs.stdenv.mkDerivation {
  name = "silent-sddm";
  src = pkgs.fetchFromGitHub {
    owner = "uiriansan";
    repo = "SilentSDDM";
    rev = "3705a132db1e101a5ec2aa14b0e28e8ccd78866a";
    hash = "sha256-znjp0gAxt+1wkxp/rqc0NPAnQGikbCAylgWGussZj0I=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/SilentSDDM
    cp -R ./* $out/share/sddm/themes/SilentSDDM

    find $out/share/sddm/themes/SilentSDDM -type f -name "*.qml" -exec sed -i 's/RedHatDisplay/${font}/g' {} +
    find $out/share/sddm/themes/SilentSDDM -type f -name "*.conf" -exec sed -i 's/RedHatDisplay/${font}/g' {} +

    ${pkgs.lib.optionalString (background != null) ''
      if [ -f "${toString background}" ]; then
        cp "${toString background}" $out/share/sddm/themes/SilentSDDM/backgrounds/custom.jpg
        sed -i 's/background = smoky.jpg/background = custom.jpg/g' $out/share/sddm/themes/SilentSDDM/configs/default.conf
      fi
    ''}
  '';
}
