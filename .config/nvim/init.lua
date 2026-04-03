require("config.lazy")

local function scan_lua_file(dir)
  local result = {}

  local function scan(current_dir)
    local scandir = vim.loop.fs_scandir(current_dir)
    if not scandir then return end
    while true do
      local name, type = vim.loop.fs_scandir_next(scandir)
      if not name then break end

      local full_path = current_dir .."/" .. name
      if type == "file" and name:sub(-4) == ".lua" then
        table.insert(result, full_path)
      elseif type == "directory" then
        print(name)
        scan(full_path)
      end
    end
  end

  scan(dir)
  return result
end

local function escape_path(path)
  return path:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end
local function load_require(path)
  local files = scan_lua_file(path)

  for _, file in ipairs(files) do
    local prev = escape_path(vim.fn.stdpath("config"))
    local mod_name = file:gsub(prev .. "/lua/", "")
      :gsub("%.lua$", "")
      :gsub("/", ".")
    -- lazy以外をインポート
    if mod_name ~= "config.lazy" then
      require(mod_name)
      print("loaded:" .. mod_name)
    end
  end
end

load_require(vim.fn.stdpath("config") .. "/lua/config") 
vim.cmd("colorscheme nightfox")
