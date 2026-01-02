{ lib, vars, ... }: {
  time.timeZone = lib.mkDefault (vars.timezone or "Asia/Jakarta");
  i18n.defaultLocale = lib.mkDefault (vars.locale or "en_US.UTF-8");
  i18n.extraLocaleSettings = {
    LC_ADDRESS = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_IDENTIFICATION = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_MEASUREMENT = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_MONETARY = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_NAME = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_NUMERIC = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_PAPER = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_TELEPHONE = lib.mkDefault (vars.locale or "en_US.UTF-8");
    LC_TIME = lib.mkDefault (vars.locale or "en_US.UTF-8");
  };
}
