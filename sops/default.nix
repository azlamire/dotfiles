{ ... } :
{
  sops.defaultSopsFile = ./secrets.yaml;
  sops.secrets."my-api-key" = {};  # refers to "my-api-key" in secrets.yaml
  systemd.services.my-api-client = {
    serviceConfig.EnvironmentFile = "/run/secrets/my-api-key";
  };
}
