-- load GameData
_G.gameData = require(game.ReplicatedStorage.gameData)

-- dependencies

local Tile = require(game.ReplicatedStorage.Tile)
local GrowthManager = require(game.ReplicatedStorage.GrowthManager)

-- services

local RunService = game:GetService("RunService")

-- create Tile objects

local tilesChildren = game.Workspace.Tiles:GetChildren()
for _, tileInstance in tilesChildren do
	local tile = Tile:new(tileInstance)
	table.insert(_G.gameData.tiles, tile)
	print(tile.position)
end


-- criar loop pro GrowthManager com delta time

RunService.Heartbeat:Connect(function(deltaTime)
	GrowthManager:run(deltaTime)
end)