local Utils = {}

---@generic T, R
---@param array T[]
---@param n integer
---@param map fun(x: T): R
---@return R[]
---@overload fun(array: T[], n: integer): T[]
function Utils.pick_unique_random(array, n, map)
  local pool = {}
  for i=1, #array do
    table.insert(pool, array[i])
  end
  while #pool > n do
    table.remove(pool, math.random(1, #pool))
  end
  if map then
    for i=1, #pool do
      pool[i] = map(pool[i])
    end
  end
  return pool
end

---@generic T
---@param t table<string, T>|T[]
---@return T[]
function Utils.table_to_array(t)
  local array = {}
  for _, value in next, t do
    table.insert(array, value)
  end
  return array
end

return Utils
