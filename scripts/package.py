from pathlib import Path
from . import util

def stage(*, clean: bool = False, regen_assets: bool = False) -> Path:
    root_dir    = util.get_root_dir()
    staging_dir = util.get_staging_dir()

    if regen_assets:
        from .gen_lune_atlas import gen_lune_atlas
        from .scale_assets import scale_assets
        gen_lune_atlas()
        scale_assets(clean=clean)

    if clean: util.delete_dir(staging_dir)
    util.copy_into(root_dir / "assets",        staging_dir)
    util.copy_into(root_dir / "localization",  staging_dir)
    util.copy_into(root_dir / "src",           staging_dir)
    util.copy_into(root_dir / "metadata.json", staging_dir)
    util.copy_into(root_dir / "LICENSE.md",    staging_dir)
    util.copy_into(root_dir / "README.md",     staging_dir)
    return staging_dir

def package(*, clean: bool = False, regen_assets: bool = False) -> Path:
    from zipfile import ZipFile, ZIP_DEFLATED
    staging_dir = stage(clean=clean, regen_assets=regen_assets)
    out_archive = staging_dir.with_suffix(".zip")
    with ZipFile(out_archive, "w", compression=ZIP_DEFLATED, compresslevel=9) as zip:
        util.zip_dir(zip, staging_dir)
    return out_archive

if __name__ == "__main__":
    import sys
    regen_assets = len(sys.argv) > 1 and sys.argv[1] == "full"
    package(clean=True, regen_assets=regen_assets)
