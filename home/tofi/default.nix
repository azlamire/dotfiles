{ ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = 36;
      anchor = "top";
      horizontal = true;
      background-color = "#000000";
      padding-top = 5;
      padding-bottom = 0;
      padding-left = 5;
      padding-right = 0;
      font-size = 12;
      font = "monospace";
      min-input-width = 120;
      result-spacing = 15;
      prompt-text = "Search: ";
      prompt-color = "#F8F8F2";
      input-color = "#50FA7B";
      input-background = "#44475A";
      input-background-padding = 3;
      input-background-corner-radius = 8;
      default-result-color = "#6272A4";
      selection-color = "#8BE9FD";
      selection-match-color = "#50FA7B";
      border-width = 0;
      border-color = "#6272A4";
      outline-width = 0;
    };
  };
}