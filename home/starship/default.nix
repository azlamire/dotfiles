{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      cmd_duration = {
        format = "took(#ec0958) [$duration]($style)";
        style = "#076653";
      };
      battery = {
        format = "[$symbol$percentage]($style) ";
        charging_symbol = "󱐋";
        discharging_symbol = "";
        display = [
          {
            threshold = 100;
            style = "#142C14"; 
          }
          {
            threshold = 90;
            style = "#537B2F"; 
          }
          {
            threshold = 75;
            style = "#FFD90F"; 
          }
          {
            threshold = 50;
            style = "#FF6600"; 
          }
          {
            threshold = 25;
            style = "#FF5A36"; 
          }
          {
            threshold = 10;
            style = "#FF2400";  
          }
        ];
      };
      character ={
        success_symbol ="[➜](#9414d1)";
        error_symbol = "[✗](#74070E)";
      };
      line_break.disabled = false;
      python = {
        detect_files = [
          ".python-version" 
          "Pipfile"
          "__init__.py" 
          "pyproject.toml" 
          "requirements.txt" 
          "setup.py"
          "tox.ini"
        ];        
        detect_extensions = [
          "py"
        ];
        disabled = true;
      };
      bun.symbol = " ";
      os.symbols.NixOS = " ";
      git_branch.symbol = " ";

      format = "
$battery$directory$git_branch$git_status
$character";
      directory = {
        format = "[$path](#ff096c) ";
        truncate_to_repo = false;
      };
    };
  };
}