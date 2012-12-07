willItLive = (cell) ->
  count = countNeighbours(cell)
  if isAlive(cell)
    count < 4 and count > 1
  else
    count is 3

countNeighbours = (cell) ->
  cell.neighbours || 1

isAlive = (cell) -> cell.alive

evolve = (universe) ->
  cells = universe.cells
  for cell in cells
    cell.alive = willItLive(cell)
  universe

key = (cell)    -> [cell.x, cell.y].join()
put = (cell)    -> window[key(cell)] = cell
get = (cellKey) -> window[cellKey]
