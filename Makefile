default: run

run:
	# force Qt to use X11 rather than Wayland since Wayland subsurface
	# errors (wl_subsurface#41) can crash the application on some systems
	QT_QPA_PLATFORM=xcb cd makehuman && uv run makehuman.py

download-assets:
	cd makehuman && uv run download_assets_git.py

install:
	uv venv && uv sync
	cd makehuman && uv run download_assets_git.py
	cd makehuman && uv run compile_models.py
	cd makehuman && uv run compile_targets.py
