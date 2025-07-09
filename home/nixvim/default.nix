{lib, ... }: 
{
  # Your existing flake inputs and outputs...
  
  programs.nixvim = { 
    enable = true;
    
    autoCmd = [
      {
        event = [ "VimEnter" ];
        command = ":TransparentEnable";
      }
      {
        event = [ "VimLeave" ];
        command = ":set guicursor=a:ver20-blinkon500";
      }
    ];

    clipboard.providers.wl-copy.enable = true;
    globals.mapleader = " ";
    keymaps = [
      { 
        mode = "n";
        action = ":UndotreeToggle<CR>";
        key = "<leader>u";
        options = {
          silent = true;
        };
      }
      { 
        mode = "n";
        action = ":Telescope<CR>";
        key = "<leader>f";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        action = ":lua vim.diagnostic.setloclist()<CR>";
        key = "<leader>w";
        options = {
          silent = true;
          desc = "Error showing";
        };
      }
      { 
        mode = "n";
        action = ":Neotree toggle<CR>";
        key = "<leader>e";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        action = ":wincmd h<CR>";
        key = "<C-h>";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        action = ":wincmd l<CR>";
        key = "<C-l>";
        options = {
          silent = true;
        };
      }
        {
          mode = "n";
          action = ":lua vim.lsp.buf.hover()<CR>";
          key = "<C-k>";
          options = {
            silent = true;
        };       
      }
    ];
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;

      shiftwidth = 4;
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      smartindent = true;
      expandtab = true;
    };

    colorschemes.kanagawa.enable = true;

    files = {
      "ftplugin/json.lua".opts = {
        shiftwidth = 2;
        tabstop = 2;
      };
      "ftplugin/nix.lua".opts = {
        shiftwidth = 2;
        tabstop = 2;
      };
    };
    extraConfigLua = ''
      vim.opt.undofile = true
      local undodir = vim.fn.stdpath('data') .. '/undodir'
      if vim.fn.isdirectory(undodir) == 0 then
        vim.fn.mkdir(undodir, "p")
      end
      vim.opt.undodir = undodir
    '';

    plugins = {
      cmp = {
        enable = true;

        settings = {
          snippet.expand = "luasnip";

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-Space>" = "cmp.mapping.complete()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            { name = "path"; }
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "cmp_tabby"; }
            { name = "treesitter"; }
          ];
        };
      };
      bufferline = {
        enable = true;
        autoLoad = true;
      };
      neogit.enable = true;
      diffview.enable = true;
      colorizer.enable = true;
      telescope.enable = true;
      comment.enable = true;
      gitsigns.enable = true;
      hmts.enable = true;
      image.enable = true; #image viewer
      illuminate.enable = true;
      luasnip.enable = true;
      fugitive.enable = true;
      lualine = {
        enable = true;
        settings = {
          sections = {
            lualine_z = [
              "vim.fn.strftime('%H:%M')"
            ];
          };
        };
      };
      undotree = {
        enable = true;
        settings = {
          WindowLayout = 2;
          ShortIndicators = 1;
          SplitWidth = 30;
          DiffpanelHeight = 10;
        };
      };
      lsp = {
        enable = true;

        servers = {
          gopls.enable = true;
          ts_ls.enable = true;
          nixd.enable = true;
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      neo-tree = {
        enable = true;
      }; 

      which-key.enable = true;
      transparent = {
        enable = true;
        settings = {
          groups = [
            "TabLine"
            "TabLineFill"
            "TabLineSel"
            "SpecialChar"
            "WinSeperator"
            "Search"
            "Normal"
            "NormalNC"
            "NormalFloat"
            "Comment"
            "Constant"
            "Special"
            "Identifier"
            "Statement"
            "PreProc"
            "Type"
            "Underlined"
            "Todo"
            "String"
            "Function"
            "Conditional"
            "Repeat"
            "Operator"
            "Structure"
            "LineNr"
            "NonText"
            "SignColumn"
            "CursorLine"
            "CursorLineNr"
            "StatusLine"
            "StatusLineNC"
            "EndOfBuffer"
            "FloatBorder"
            "NeoTreeEndOfBuffer"
            "NeoTreeFileStats"
            "NeoTreeFileStatsHeader"
            "NeoTreeStatusLine"
            "NeoTreeStatusLineNC"
            "NeoTreeTitleBar"
            "NeoTreeNormal"
            "NeoTreeNormalNC"
            "NeoTreeFilterTerm"
            "NeoTreeFileName"
            "NeoTreeFileOpened"
            "NeoTreeFloatNormal"
            "NeoTreeFloatTitle"
            "DiagnosticError"
            "DiagnosticDeprecated"
            "DiagnosticFloatingError"
            "DiagnosticFloatingWarn"
            "DiagnosticSignError"
            "DiagnosticSignWarn"
            "CmpCompletion"
            "BufferLineBuffer"
            "BufferLineDevIconGitIgnoreSelected"
            "BufferLineDevIconGitIgnoreInactive"
            "BufferLineDevIconGitIgnore"
            "BufferLineDevIconGitLogo"
            "BufferLineDevIconGitLogoInactive"
            "BufferLineDevIconGitLogoSelected"
            "BufferLineDevIconConfigSelected"
            "BufferLineDevIconConfigInactive"
            "BufferLineDevIconConfig"
            "BufferLineDevIconPy"
            "BufferLineDevIconPyInactive"
            "BufferLineDevIconPySelected"
            "BufferLineDevIconDefaultInactive"
            "BufferLineDevIconDefaultSelected"
            "BufferLineDevIconNix"
            "BufferLineDevIconNixInactive"
            "BufferLineDevIconNixSelected"
            "BufferLineDevIconGitConfigSelected" 
            "BufferLineDevIconZshrc"
            "BufferLineDevIconZshrcInactive"
            "BufferLineDevIconZshrcSelected"
            "BufferLineDevIconTypeScript"
            "BufferLineDevIconTypeScriptInactive"
            "BufferLineDevIconTypeScriptSelected"
            "BufferLineDevIconLicense"
            "BufferLineDevIconLicenseInactive"
            "BufferLineDevIconLicenseSelected"
            "BufferLineDevIconMd"
            "BufferLineDevIconMdInactive"
            "BufferLineDevIconMdSelected"
            "BufferLineDevIconPackageLockJson"
            "BufferLineDevIconPackageLockJsonInactive"
            "BufferLineDevIconPackageLockJsonSelected"
            "BufferLineDevIconSql"
            "BufferLineDevIconSqlInactive"
            "BufferLineDevIconSqlSelected"
            "BufferLineDevIconCss" 
            "BufferLineDevIconCssInactive" 
            "BufferLineDevIconCssSelected"
            "BufferLineDevIconDefaultInactive"
            "BufferLineDevIconDefaultSelected"
            "BufferLineDevIconHtml"
            "BufferLineDevIconHtmlInactive"
            "BufferLineDevIconHtmlSelected"
            "BufferLineDevIconJs"
            "BufferLineDevIconJsInactive"
            "BufferLineDevIconJsSelected"
            "BufferLineDevIconJson"
            "BufferLineDevIconJsonInactive"
            "BufferLineDevIconJsonSelected"
            "BufferLineDevIconLock"
            "BufferLineDevIconLockInactive"
            "BufferLineDevIconLockSelected" 
            "BufferLineDevIconMd"
            "BufferLineDevIconMdInactive"
            "BufferLineDevIconMdSelected"
            "BufferLineDevIconPackageJson"
            "BufferLineDevIconPackageJsonInactive"
            "BufferLineDevIconPackageJsonSelected"
            "BufferLineDevIconSvg"
            "BufferLineDevIconSvgInactive"
            "BufferLineDevIconSvgSelected"
            "BufferLineDevIconTSConfig"
            "BufferLineDevIconTSConfigInactive"
            "BufferLineDevIconTSConfigSelected"
            "BufferLineDevIconTsx"
            "BufferLineDevIconTsxInactive"
            "BufferLineDevIconTsxSelected"
            "lualine_b_normal"
            "lualine_b_command"
            "lualine_c_normal"
            "lualine_c_command"
            "lualine_b_diff_added_command"
            "lualine_b_diff_added_inactive"
            "lualine_b_diff_added_insert"
            "lualine_b_diff_added_normal"
            "lualine_b_diff_added_replace"
            "lualine_b_diff_added_terminal"
            "lualine_b_diff_added_visual"
            "lualine_b_diff_modified_command"
            "lualine_b_diff_modified_inactive"
            "lualine_b_diff_modified_insert"
            "lualine_b_diff_modified_normal"
            "lualine_b_diff_modified_replace"
            "lualine_b_diff_modified_terminal"
            "lualine_b_diff_modified_visual"
            "lualine_b_diff_removed_command"
            "lualine_b_diff_removed_inactive"
            "lualine_b_diff_removed_insert"
            "lualine_b_diff_removed_normal"
            "lualine_b_diff_removed_replace"
            "lualine_b_diff_removed_terminal"
            "lualine_b_diff_removed_visual"
            "lualine_b_inactive"
            "lualine_b_insert"
            "lualine_transitional_lualine_a_command_to_lualine_b_command" 
            "lualine_transitional_lualine_a_command_to_lualine_b_normal" 
            "lualine_transitional_lualine_a_command_to_lualine_c_normal" 
            "lualine_transitional_lualine_a_command_to_lualine_b_diagnostics_warn_command" 
            "lualine_transitional_lualine_a_insert_to_lualine_b_diagnostics_warn_insert" 
            "lualine_transitional_lualine_a_insert_to_lualine_b_insert" 
            "lualine_transitional_lualine_a_insert_to_lualine_c_normal"
            "lualine_transitional_lualine_a_normal_to_lualine_b_diagnostics_warn_normal" 
            "lualine_transitional_lualine_a_normal_to_lualine_b_normal" 
            "lualine_transitional_lualine_a_normal_to_lualine_c_normal"
            "lualine_transitional_lualine_a_insert_to_lualine_b_diagnostics_error_insert"
            "lualine_transitional_lualine_a_command_to_lualine_b_diagnostics_error_command"
            "lualine_transitional_lualine_a_normal_to_lualine_b_diagnostics_error_normal"
            "lualine_transitional_lualine_a_visual_to_lualine_b_diagnostics_error_visual"
            "lualine_transitional_lualine_a_visual_to_lualine_b_diagnostics_warn_visual"
            "lualine_transitional_lualine_a_visual_to_lualine_b_visual"
            "lualine_transitional_lualine_b_command_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_warn_command_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_warn_insert_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_warn_normal_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_warn_visual_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_error_command_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_error_insert_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_error_normal_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_error_visual_to_lualine_c_normal"
            "lualine_transitional_lualine_b_diagnostics_hint_command_to_lualine_c_normal"                    
            "lualine_transitional_lualine_b_diagnostics_hint_insert_to_lualine_c_normal"                    
            "lualine_transitional_lualine_b_diagnostics_hint_normal_to_lualine_c_normal"                    
            "lualine_transitional_lualine_b_diagnostics_hint_visual_to_lualine_c_normal"                    
            "lualine_transitional_lualine_b_insert_to_lualine_c_normal"
            "lualine_transitional_lualine_b_normal_to_lualine_c_normal"
            "lualine_transitional_lualine_b_visual_to_lualine_c_normal"
            "lualine_transitional_lualine_a_visual_to_lualine_c_normal"  
            "lualine_b_diagnostics_error_command"
            "lualine_b_diagnostics_error_inactive"
            "lualine_b_diagnostics_error_insert"
            "lualine_b_diagnostics_error_normal"
            "lualine_b_diagnostics_error_replace"
            "lualine_b_diagnostics_error_terminal"
            "lualine_b_diagnostics_error_visual" "lualine_b_diagnostics_hint_command"
            "lualine_b_diagnostics_hint_inactive"
            "lualine_b_diagnostics_hint_insert"
            "lualine_b_diagnostics_hint_normal"
            "lualine_b_diagnostics_hint_replace"
            "lualine_b_diagnostics_hint_terminal"
            "lualine_b_diagnostics_hint_visual"
            "lualine_b_diagnostics_info_command"
            "lualine_b_diagnostics_info_inactive"
            "lualine_b_diagnostics_info_insert"
            "lualine_b_diagnostics_info_normal"
            "lualine_b_diagnostics_info_replace"
            "lualine_b_diagnostics_info_terminal"
            "lualine_b_diagnostics_info_visual"
            "lualine_b_diagnostics_warn_command"
            "lualine_b_diagnostics_warn_inactive"
            "lualine_b_diagnostics_warn_insert"
            "lualine_b_diagnostics_warn_normal"
            "lualine_b_diagnostics_warn_replace"
            "lualine_b_diagnostics_warn_terminal"
            "lualine_b_diagnostics_warn_visual"
            "lualine_x_filetype_DevIconGitIgnore_command"
            "lualine_x_filetype_DevIconGitIgnore_inactive"
            "lualine_x_filetype_DevIconGitIgnore_insert"
            "lualine_x_filetype_DevIconGitIgnore_normal"
            "lualine_x_filetype_DevIconGitIgnore_replace"
            "lualine_x_filetype_DevIconGitIgnore_terminal"
            "lualine_x_filetype_DevIconGitIgnore_visual"
            "lualine_x_filetype_DevIconConfig_command"
            "lualine_x_filetype_DevIconConfig_inactive"
            "lualine_x_filetype_DevIconConfig_insert"
            "lualine_x_filetype_DevIconConfig_normal"
            "lualine_x_filetype_DevIconConfig_replace"
            "lualine_x_filetype_DevIconConfig_terminal"
            "lualine_x_filetype_DevIconConfig_visual"
            "lualine_x_filetype_DevIconHtml_replace"
            "lualine_x_filetype_DevIconCss_command"
            "lualine_x_filetype_DevIconCss_inactive"
            "lualine_x_filetype_DevIconCss_insert"
            "lualine_x_filetype_DevIconCss_normal"
            "lualine_x_filetype_DevIconCss_replace"
            "lualine_x_filetype_DevIconCss_terminal"
            "lualine_x_filetype_DevIconCss_visual"
            "lualine_x_filetype_DevIconDefault_command"
            "lualine_x_filetype_DevIconDefault_inactive"
            "lualine_x_filetype_DevIconDefault_insert"
            "lualine_x_filetype_DevIconDefault_normal"
            "lualine_x_filetype_DevIconDefault_replace"
            "lualine_x_filetype_DevIconDefault_terminal"
            "lualine_x_filetype_DevIconDefault_visual"
            "lualine_x_filetype_DevIconHtml_command"
            "lualine_x_filetype_DevIconHtml_inactive"
            "lualine_x_filetype_DevIconHtml_insert"
            "lualine_x_filetype_DevIconHtml_normal"
            "lualine_x_filetype_DevIconHtml_replace"
            "lualine_x_filetype_DevIconHtml_terminal"
            "lualine_x_filetype_DevIconHtml_visual"
            "lualine_x_filetype_DevIconJs_command"
            "lualine_x_filetype_DevIconJs_inactive"
            "lualine_x_filetype_DevIconJs_insert"
            "lualine_x_filetype_DevIconJs_normal"
            "lualine_x_filetype_DevIconJs_replace"
            "lualine_x_filetype_DevIconJs_terminal"
            "lualine_x_filetype_DevIconJs_visual"
            "lualine_x_filetype_DevIconLock_command"
            "lualine_x_filetype_DevIconLock_inactive"
            "lualine_x_filetype_DevIconLock_insert"
            "lualine_x_filetype_DevIconLock_normal"
            "lualine_x_filetype_DevIconLock_replace"
            "lualine_x_filetype_DevIconLock_terminal"
            "lualine_x_filetype_DevIconLock_visual"
            "lualine_x_filetype_DevIconMd_command"
            "lualine_x_filetype_DevIconMd_inactive"
            "lualine_x_filetype_DevIconMd_insert"
            "lualine_x_filetype_DevIconMd_normal"
            "lualine_x_filetype_DevIconMd_replace"
            "lualine_x_filetype_DevIconMd_replace"
            "lualine_x_filetype_DevIconMd_terminal"
            "lualine_x_filetype_DevIconMd_visual"
            "lualine_x_filetype_DevIconPackageJson_command"
            "lualine_x_filetype_DevIconPackageJson_inactive"
            "lualine_x_filetype_DevIconPackageJson_insert"
            "lualine_x_filetype_DevIconPackageJson_normal"
            "lualine_x_filetype_DevIconPackageJson_replace"
            "lualine_x_filetype_DevIconPackageJson_terminal"
            "lualine_x_filetype_DevIconPackageJson_visual"
            "lualine_x_filetype_DevIconSvg_command"
            "lualine_x_filetype_DevIconSvg_inactive"
            "lualine_x_filetype_DevIconSvg_insert"
            "lualine_x_filetype_DevIconSvg_normal"
            "lualine_x_filetype_DevIconSvg_replace"
            "lualine_x_filetype_DevIconSvg_terminal"
            "lualine_x_filetype_DevIconSvg_visual"
            "lualine_x_filetype_DevIconTSConfig_command"
            "lualine_x_filetype_DevIconTSConfig_inactive"
            "lualine_x_filetype_DevIconTSConfig_insert"
            "lualine_x_filetype_DevIconTSConfig_normal"
            "lualine_x_filetype_DevIconTSConfig_replace"
            "lualine_x_filetype_DevIconTSConfig_terminal"
            "lualine_x_filetype_DevIconTSConfig_visual"
            "lualine_x_filetype_DevIconTsx_command"
            "lualine_x_filetype_DevIconTsx_inactive"
            "lualine_x_filetype_DevIconTsx_insert"
            "lualine_x_filetype_DevIconTsx_normal"
            "lualine_x_filetype_DevIconTsx_replace"
            "lualine_x_filetype_DevIconTsx_terminal"
            "lualine_x_filetype_DevIconTsx_visual"
            "lualine_x_filetype_DevIconNix_command"
            "lualine_x_filetype_DevIconNix_inactive"
            "lualine_x_filetype_DevIconNix_insert"
            "lualine_x_filetype_DevIconNix_normal"
            "lualine_x_filetype_DevIconNix_replace"
            "lualine_x_filetype_DevIconNix_terminal"
            "lualine_x_filetype_DevIconNix_visual"
            "lualine_x_filetype_DevIconTypeScript_command"
            "lualine_x_filetype_DevIconTypeScript_inactive"
            "lualine_x_filetype_DevIconTypeScript_insert"
            "lualine_x_filetype_DevIconTypeScript_normal"
            "lualine_x_filetype_DevIconTypeScript_replace"
            "lualine_x_filetype_DevIconTypeScript_terminal"
            "lualine_x_filetype_DevIconTypeScript_visual"
            "lualine_x_filetype_DevIconTypeScript_terminal"
            "lualine_x_filetype_DevIconPy_command"
            "lualine_x_filetype_DevIconPy_inactive"
            "lualine_x_filetype_DevIconPy_insert"
            "lualine_x_filetype_DevIconPy_normal"
            "lualine_x_filetype_DevIconPy_replace"
            "lualine_x_filetype_DevIconPy_terminal"
            "lualine_x_filetype_DevIconPy_visual"
            "lualine_x_filetype_DevIconTxt_command"
            "lualine_x_filetype_DevIconTxt_inactive"
            "lualine_x_filetype_DevIconTxt_insert"
            "lualine_x_filetype_DevIconTxt_normal"
            "lualine_x_filetype_DevIconTxt_replace"
            "lualine_x_filetype_DevIconTxt_terminal"
            "lualine_x_filetype_DevIconTxt_visual"
            "lualine_x_filetype_DevIconTxt_visual"
            "lualine_x_filetype_DevIconDefault_command"
            "lualine_x_filetype_DevIconDefault_inactive"
            "lualine_x_filetype_DevIconDefault_insert"
            "lualine_x_filetype_DevIconDefault_normal"
            "lualine_x_filetype_DevIconDefault_replace"
            "lualine_x_filetype_DevIconDefault_terminal"
            "lualine_x_filetype_DevIconDefault_visual"
            "lualine_x_filetype_DevIconGitConfig_command"
            "lualine_x_filetype_DevIconGitConfig_inactive"
            "lualine_x_filetype_DevIconGitConfig_insert"
            "lualine_x_filetype_DevIconGitConfig_normal"
            "lualine_x_filetype_DevIconGitConfig_replace"
            "lualine_x_filetype_DevIconGitConfig_terminal"
            "lualine_x_filetype_DevIconGitConfig_visual"
            "lualine_x_filetype_DevIconZshrc_command"
            "lualine_x_filetype_DevIconZshrc_inactive"
            "lualine_x_filetype_DevIconZshrc_insert"
            "lualine_x_filetype_DevIconZshrc_normal"
            "lualine_x_filetype_DevIconZshrc_replace"
            "lualine_x_filetype_DevIconZshrc_terminal"
            "lualine_x_filetype_DevIconZshrc_visual"
            "lualine_x_filetype_DevIconLicense_command"
            "lualine_x_filetype_DevIconLicense_inactive"
            "lualine_x_filetype_DevIconLicense_insert"
            "lualine_x_filetype_DevIconLicense_normal"
            "lualine_x_filetype_DevIconLicense_replace"
            "lualine_x_filetype_DevIconLicense_terminal"
            "lualine_x_filetype_DevIconLicense_visual"
            "lualine_x_filetype_DevIconPackageJson_command"
            "lualine_x_filetype_DevIconPackageJson_inactive"
            "lualine_x_filetype_DevIconPackageJson_insert"
            "lualine_x_filetype_DevIconPackageJson_normal"
            "lualine_x_filetype_DevIconPackageJson_replace"
            "lualine_x_filetype_DevIconPackageJson_terminal"
            "lualine_x_filetype_DevIconPackageJson_visual"
            "lualine_x_filetype_DevIconPackageLockJson_command"
            "lualine_x_filetype_DevIconPackageLockJson_inactive"
            "lualine_x_filetype_DevIconPackageLockJson_insert"
            "lualine_x_filetype_DevIconPackageLockJson_normal"
            "lualine_x_filetype_DevIconPackageLockJson_replace"
            "lualine_x_filetype_DevIconPackageLockJson_terminal"
            "lualine_x_filetype_DevIconPackageLockJson_visual"
            "NoiceCmdlineIcon"
            "NoiceCmdlinePopup"
            "NoiceCmdlinePopupBorder"
            "NoiceCmdlinePopupBorderCalculator"
            "NoiceCmdlinePopupBorderCmdline"
            "NoiceCmdlinePopupBorderFilter"
            "NoiceCmdlinePopupBorderHelp"
            "NoiceCmdlinePopupBorderIncRename"
            "NoiceCmdlinePopupBorderInput"
            "NoiceCmdlinePopupBorderLua"
            "NoiceCmdlinePopupBorderSearch"
            "NoiceCmdlinePopupTitle"
            "NoiceCmdlinePrompt"
            "WildMenu"
            "WinBar"
            "WinBarNC"
            "WhichKey"
            "WhichKeyNormal"
            "BufferLineBackground"
            "Pmenu"
            "TelescopeBorder"
            "TelescopeResultsClass"
            "TelescopeTitle"
          ];
        };
      };
      treesitter = {
        enable = true;
        nixvimInjections = true;
        settings = {
          indent.enable = true;
        };
      };
      treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          clearOnCursorMove = true; 
        };
      };
      noice.enable = true;
      web-devicons.enable = true;
    }; 
  };
}