from . import util
from .package import stage

def install(*, clean: bool = False, regen_assets: bool = False):
    mods_dir = util.get_mods_dir()
    staging_dir = stage(clean=clean, regen_assets=regen_assets)
    if clean:
        mod_dir = mods_dir / staging_dir.name
        util.delete_dir(mod_dir)
    util.copy_into(staging_dir, mods_dir)

if __name__ == "__main__":
    import sys
    regen_assets = len(sys.argv) > 1 and sys.argv[1] == "full"
    install(clean=True, regen_assets=regen_assets)
