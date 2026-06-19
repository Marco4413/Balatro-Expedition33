from pathlib import Path
from zipfile import ZipFile

MOD_NAME = "Balatro_Expedition33"

class DirectoryNotFoundError(OSError): ...

def get_root_dir() -> Path:
    return Path(__file__).parent.parent.relative_to(Path.cwd(), walk_up=True)

def get_build_dir() -> Path:
    return get_root_dir() / "build"

def get_staging_dir() -> Path:
    return get_build_dir() / MOD_NAME

def get_mods_dir() -> Path:
    import os, sys
    if sys.platform == "win32":
        env_appdata = os.getenv("APPDATA")
        if env_appdata is None:
            raise KeyError("could not find %APPDATA%")
        appdata_dir = Path(env_appdata)
        mods_dir = appdata_dir / "Balatro" / "Mods"
        if not mods_dir.is_dir():
            raise DirectoryNotFoundError(f"could not find mods directory at: {mods_dir}")
        return mods_dir
    else:
        assert False, f"[get_mods_dir]: unsupported os: {sys.platform}"

def copy_into(src_path: Path, dst_dir: Path):
    import shutil
    if not dst_dir.exists():
        dst_dir.mkdir(parents=True, exist_ok=True)
    if not dst_dir.is_dir():
        raise NotADirectoryError(f"cannot copy '{src_path}' into '{dst_dir}' because the latter is not a directory")
    dst_path = dst_dir / src_path.name
    if src_path.is_dir():
        shutil.copytree(src_path, dst_path, dirs_exist_ok=True)
    else:
        shutil.copy2(src_path, dst_path)
    print(f"copy: {src_path} -> {dst_path}")

def delete_dir(dir_path: Path, *, force: bool = False) -> bool:
    import shutil
    if not dir_path.exists():
        return True
    if not dir_path.is_dir():
        raise NotADirectoryError(f"cannot delete '{dir_path}' because it is not a directory")
    if not force:
        user_choice = input(f"delete: {dir_path} (Y/N): ")
        if user_choice.lower() != "y": return False
    shutil.rmtree(dir_path)
    print(f"delete: {dir_path}")
    return True

def zip_dir(zip: ZipFile, src_path: Path):
    if not src_path.is_dir():
        raise NotADirectoryError(f"cannot zip '{src_path}' because it is not a directory")
    for root, _, files in src_path.walk():
        for file in files:
            file_path = root / file
            arch_path = file_path.relative_to(src_path.parent)
            zip.write(file_path, arch_path)
            print(f"zip: {arch_path}")

class Flags:
    def __init__(self, args: list[str]|None = None):
        if args is None:
            from sys import argv
            args = argv[1:]
        self._flags: dict[str, bool] = dict()
        self.parse(args)

    def parse(self, args: list[str]):
        for flag in args:
            value = True
            id_start = 0
            for c in flag:
                if c != "!": break
                value = not value
                id_start += 1
            self._flags[flag[id_start:]] = value

    def get(self, name: str, default: bool|None = None) -> bool:
        return self._flags.get(name, False if default is None else default)
