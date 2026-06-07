from PIL import Image
from pathlib import Path

ROOT_DIR = Path(__file__).parent.parent.relative_to(Path.cwd(), walk_up=True)

ASSETS_PATH = ROOT_DIR / "assets"
ASSETS_1X_PATH = ASSETS_PATH / "1x"
ASSETS_2X_PATH = ASSETS_PATH / "2x"

ASSETS_1X_PATH.mkdir(parents=True, exist_ok=True)
ASSETS_2X_PATH.mkdir(parents=True, exist_ok=True)

for file_path in ASSETS_1X_PATH.glob("**/*.png"):
    if not file_path.is_file(): continue
    with Image.open(file_path) as image_asset:
        file_path_relative_to_root = file_path.relative_to(ASSETS_1X_PATH)
        resized_file_path = ASSETS_2X_PATH / file_path_relative_to_root
        resized_file_path.parent.mkdir(parents=True, exist_ok=True)

        (original_width, original_height) = image_asset.size
        image_asset_2x = image_asset.resize(
                (original_width*2, original_height*2),
                Image.Resampling.NEAREST)
        image_asset_2x.save(resized_file_path)

        print(f"{file_path} -> {resized_file_path}")
