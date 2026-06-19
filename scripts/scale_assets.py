from PIL import Image
from . import util

def scale_assets(*, clean: bool = False, force: bool = False):
    root_dir = util.get_root_dir()
    assets_dir = root_dir / "assets"
    assets_1x_dir = assets_dir / "1x"
    assets_2x_dir = assets_dir / "2x"

    if clean: util.delete_dir(assets_2x_dir, force=force)

    assets_1x_dir.mkdir(parents=True, exist_ok=True)
    assets_2x_dir.mkdir(parents=True, exist_ok=True)

    for file_path in assets_1x_dir.glob("**/*.png"):
        if not file_path.is_file(): continue
        with Image.open(file_path) as image_asset:
            file_path_relative_to_root = file_path.relative_to(assets_1x_dir)
            resized_file_path = assets_2x_dir / file_path_relative_to_root
            resized_file_path.parent.mkdir(parents=True, exist_ok=True)

            (original_width, original_height) = image_asset.size
            image_asset_2x = image_asset.resize(
                    (original_width*2, original_height*2),
                    Image.Resampling.NEAREST)
            image_asset_2x.save(resized_file_path)

            print(f"scale: {file_path} -> {resized_file_path}")

if __name__ == "__main__":
    flags = util.Flags()
    scale_assets(clean=flags.get("clean", True), force=flags.get("force"))
