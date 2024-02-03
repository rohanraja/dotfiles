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
  local entityType = vim.api.nvim_get_current_line():match("@(%w+)")

  Job:new({
    command = "curl",
    args = { "http://localhost:8005/run?commandName=GetEntityOfType&EntityType=" .. entityType },
    on_exit = function(j, return_val)
      local result = j:result()

      local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
      if not ok then
        return
      end
      items = {}
      for k, v in pairs(parsed) do
        table.insert(items, { label = k })
      end

      callback({ items = items, isIncomplete = false })
    end,
  }):start()
end

function source:get_trigger_characters()
  return { '"', ":", " " }
end

function source:is_available()
  -- When current line contains "@"
  return vim.api.nvim_get_current_line():find("@") ~= nil -- and vim.api.nvim_get_current_line():find(":") ~= nil
end

require("cmp").register_source("devmate_entityrecord", source.new())
