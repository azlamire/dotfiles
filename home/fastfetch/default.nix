{ ... }:
{
  # TODO: Wait until vagrant arch downloads
  programs.fastfetch = {
    enable  = true;
    settings  = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "builtin";
        padding = {
          right = 1;
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator =  " ";
      };
      modules = [
         {
           type = "datetime";
           key = "Date";
           format = "{1}-{3}-{11}";
         }
         {
           type = "datetime";
           key = "Time";
           format = "{14}:{17}:{20}";
         }
         "break"
         "player"
         "media"
      ];

    };
  };
}

