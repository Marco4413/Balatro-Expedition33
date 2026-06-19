from . import util
from .package import stage

def install(*, clean: bool = False, regen_assets: bool = False, force: bool = False):
    mods_dir = util.get_mods_dir()
    staging_dir = stage(clean=clean, regen_assets=regen_assets, force=force)
    if clean:
        mod_dir = mods_dir / staging_dir.name
        util.delete_dir(mod_dir, force=force)
    util.copy_into(staging_dir, mods_dir)

if __name__ == "__main__":
    flags = util.Flags()
    install(clean=flags.get("clean", True), regen_assets=flags.get("regen"), force=flags.get("force"))
