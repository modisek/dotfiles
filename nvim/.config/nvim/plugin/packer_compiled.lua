-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kgosi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kgosi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kgosi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kgosi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kgosi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["easyjava.vim"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/easyjava.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  kommentary = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["kosmikoa.nvim"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/kosmikoa.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\2ë\2\0\0\4\0\f\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\a\0005\3\4\0>\3\1\0025\3\5\0>\3\2\0025\3\6\0>\3\3\0025\3\a\0>\3\4\0025\3\b\0>\3\5\0025\3\t\0>\3\6\2=\2\n\0014\2\0\0=\2\v\1B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\topen\6{\nclose\6}\1\0\2\topen\6[\nclose\6]\1\0\2\topen\6(\nclose\6)\1\0\2\topen\6`\nclose\6`\1\0\2\topen\6\"\nclose\6\"\1\0\2\topen\6'\nclose\6'\1\0\a\21ignore_beginning\2\15act_as_tab\2\21act_as_shift_tab\1\15completion\2\21enable_backwards\2\21backwards_tabkey\f<S-Tab>\vtabkey\n<Tab>\nsetup\vtabout\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  vimwiki = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  vlime = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/vlime"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/kgosi/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
