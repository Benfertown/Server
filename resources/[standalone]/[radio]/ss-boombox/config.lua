Config = {}

Config.UsingQbTarget = true -- If you have qb-target make it true otherwise make it false.
Config.MaxDistanceAtFullVolume = 40.0 -- Maximum distance to which music can me heared at full volume
Config.isSoundPublic = true -- true = everyone can hear from car, false means only you can hear the music
Config.ItemLinked = "speaker" --  if you want to link this to an item you can use Config.ItemLinked = 'itemnamehere'
Config.CommandVehicle = "music" -- Only will work if Config.ItemLinked == false

Config.MusicZones = {
	-- {
	-- 	name = "Bennys Mechanic Shop",
	-- 	coords = vector3(-212.52, -1341.59, 34.89),
	-- 	job = "mechanic", --Only person with This job can have music controls
	-- 	volume = 0.1, -- Default volume (0.0 to 1.0 as per xsound documentation)
	-- 	range = 20.0, -- Maximum distance to which music can me heared at full volume
	-- 	defaultLink = "https://www.youtube.com/watch?v=pTIN6-pLeds", -- Default song link (Leave Empty to playnothing)
	-- 	isplaying = true, -- music automatically start playing defaultLink with server start/re-start
	-- 	loop = true, -- loop a song
	-- 	defaultTime = 0 -- start song from 0ms
	-- },
	-- {
	-- 	name = "Vanilla Unicorn",
	-- 	coords = vector3(120.59, -1281.14, 29.48),
	-- 	job = "unicorn",
	-- 	volume = 0.1,
	-- 	range = 10.0,
	-- 	defaultLink = "",
	-- 	isplaying = true,
	-- 	loop = true,
	-- 	defaultTime = 0
	-- },

	{
		name = "Bahama Mamas",
		coords = vector3(-1382.12, -614.48, 31.5),
		job = "dj", --Only person with This job can have music controls
		volume = 0.5, -- Default volume (0.0 to 1.0 as per xsound documentation)
		range = 20.0, -- Maximum distance to which music can me heared at full volume
		defaultLink = "https://www.youtube.com/watch?v=EidiVnclSL4", -- Default song link (Leave Empty to playnothing)
		isplaying = false, -- music automatically start playing defaultLink with server start/re-start
		loop = false, -- loop a song
		defaultTime = 0 -- start song from 0ms
	},
}
