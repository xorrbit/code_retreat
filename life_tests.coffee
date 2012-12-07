describe "under population", ->
  it "living die with 0 neigbours", ->
    cell = 
      neighbours: 0
      alive:      true
    expect(willItLive(cell)).toBe(false)

describe "continuity", ->
  it "lives with 2 neighbours", ->
    cell =
      neighbours: 2
      alive: true
    expect(willItLive(cell)).toBe(true)
  it "stays dead with 2 neighbours", ->
    cell =
      neighbours: 2
      alive: false
    expect(willItLive(cell)).toBe(false)

describe "overcrowding", ->
  it "it dies with 4", ->
    cell = 
      neighbours: 4
      alive: true
    expect(willItLive(cell)).toBe(false)

describe "reproduction", ->
  it "knows that dead cells are brought to life with 3 neighbours", ->
    cell =
      neighbours: 3
      alive: false
    expect(willItLive(cell)).toBe(true)

describe "countNeighbours", ->
  it "knows the neighbour count of a cell", ->
    cell =
      neighbours: 3
    expect(countNeighbours(cell)).toBe(3)

describe "isAlive", ->
  it "knows if a cell is alive", ->
    cell =
      alive: true
    expect(isAlive(cell)).toBe(true)

describe 'evolve', ->
  it 'knows a universe with a cell with 2 neighbours, leaves it alone', ->
    universe = 
      cells:[
        {alive: true,neighbours: 2}
        {alive: true,neighbours: 2}
      ]
    newUniverse = evolve(universe)
    expect(newUniverse.cells[1].alive).toBe(true)
  it 'knows a universe with a cell with 1 neighbour, kill it', ->
    universe =
      cells:[
        {alive: true,neighbours: 1}
        {alive: true,neighbours: 1}
      ]
    newUniverse = evolve(universe)
    expect(newUniverse.cells[1].alive).toBe(false)

describe "key", ->
  it "knows how to turn a cell into a key", ->
    cell =
      x: 1
      y: 1
    expect(key(cell)).toBe('1,1')

describe "stores cells as keys", ->
  it "knows how to store and look up a cell with it's key", ->
    cell = 
      x: 1
      y: 1
    put(cell)
    expect(get('1,1')).toBe(cell)
  it "can store two keys lolololol", ->
    cell1 =
      x: 1
      y: 1
    cell2 =
      x: 1
      y: 2
    put(cell1)
    put(cell2)
    expect(get(key(cell1))).toBe(cell1)
    expect(get(key(cell2))).toBe(cell2)
    expect(countNeighbours(cell1)).toBe(1)

