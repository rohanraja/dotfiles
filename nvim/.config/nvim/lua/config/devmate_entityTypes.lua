local ok, Job = pcall(require, "plenary.job")
if not ok then
  return
end

local source = {}

local enabled = true

source.new = function()
  local self = setmetatable({ cache = {} }, { __index = source })

  return self
end

function source:complete(params, callback)
  Job:new({
    command = "curl",
    args = { "http://localhost:8005/run?commandName=GetEntityTypes" },
    on_exit = function(j, return_val)
      local result = j:result()

      local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
      if not ok then
        return
      end
      items = {}

      -- parsed is a list of strings, create table with label
      for _, v in pairs(parsed) do
        table.insert(items, { label = v })
      end

      callback({ items = items, isIncomplete = false })
    end,
  }):start()
end

function source:is_available()
  -- When current line contains "@" and there is no space after the @ char
  return vim.api.nvim_get_current_line():find("@") ~= nil and vim.api.nvim_get_current_line():find("@%s") == nil
end

function source:get_trigger_characters()
  return { "@" }
end

local cmp = require("cmp")

cmp.register_source("devmate_entityType", source.new())
