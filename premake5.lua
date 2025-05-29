IMGUI_NODE_EDITOR_STATIC_LINKINK = true

project "ImGui-node-editor"
	if IMGUI_NODE_EDITOR_STATIC_LINKINK then
		kind "StaticLib"
	else
		kind "SharedLib"
	end
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

	if not IMGUI_STATIC_LINKINK then
		defines { "IMGUI_API=__declspec(dllexport)" }
	end
	if not IMGUI_NODE_EDITOR_STATIC_LINKINK then
		defines { "IMGUI_NODE_EDITOR_API=__declspec(dllexport)" }
	end

	links
	{
		"ImGui"
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
