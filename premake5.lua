project "ImGui-node-editor"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "off"

	warnings "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"**.h",
		"**.cpp",
		"**.inl"
	}

	includedirs
	{
		"%{IncludeDir.ImGui}",
		"external/DXSDK/include"
	}

	removefiles
	{
		"examples/**"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "on"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
