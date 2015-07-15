newoption({
	trigger = "gmcommon",
	description = "Sets the path to the garrysmod_common (https://bitbucket.org/danielga/garrysmod_common) directory",
	value = "path to garrysmod_common dir"
})

local gmcommon = _OPTIONS.gmcommon or os.getenv("GARRYSMOD_COMMON")
if gmcommon == nil then
	error("you didn't provide a path to your garrysmod_common (https://bitbucket.org/danielga/garrysmod_common) directory")
end

include(gmcommon)

CreateSolution("luaerror")
	CreateProject(SERVERSIDE, SOURCES_MANUAL)
		warnings("Default")
		AddFiles({
			"main.cpp",
			"server.cpp",
			"server.hpp",
			"shared.cpp",
			"shared.hpp"
		})
		IncludeSourceSDK()
		IncludeScanning()
		IncludeDetouring()

	CreateProject(CLIENTSIDE, SOURCES_MANUAL)
		AddFiles({
			"main.cpp",
			"shared.cpp",
			"shared.hpp"
		})