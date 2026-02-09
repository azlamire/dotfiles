{ config, lib, ... }: {
  options.modules.doh.enable = lib.mkEnableOption "DnsOverHttps";
}
