import dataclasses
from dataclasses import dataclass
from pathlib import Path
from typing import Any, ClassVar
from zipfile import ZipFile

class DirectoryNotFoundError(OSError): ...

def get_mod_name() -> str:
    return ModMetadata.get().id

def get_mod_version() -> str:
    return ModMetadata.get().version

def get_root_dir() -> Path:
    return Path(__file__).parent.parent.relative_to(Path.cwd(), walk_up=True)

def get_build_dir() -> Path:
    return get_root_dir() / "build"

def get_staging_dir() -> Path:
    return get_build_dir() / get_mod_name()

def get_artifact_dir() -> Path:
    return get_build_dir() / "artifact"

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

def mkdir(dir_path: Path):
    if dir_path.exists():
        if not dir_path.is_dir():
            raise NotADirectoryError(f"'{dir_path}' already exists and is not a directory")
    else:
        dir_path.mkdir(parents=True, exist_ok=True)
        print(f"mkdir: {dir_path}")

def copy_into(src_path: Path, dst_dir: Path):
    import shutil
    if dst_dir.exists() and not dst_dir.is_dir():
        raise NotADirectoryError(f"cannot copy '{src_path}' into '{dst_dir}' because the latter is not a directory")
    mkdir(dst_dir)
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

def dataclass_init_from_kwargs(instance: object, /, **kwargs: Any):
    """Initializes dataclass `instance` with `kwargs`, extra arguments are ignored."""
    if not dataclasses.is_dataclass(instance) or isinstance(instance, type):
        raise TypeError("dataclass_init_from_kwargs() should be called on dataclass instances")

    for field in dataclasses.fields(instance):
        value: Any = dataclasses.MISSING
        if field.name in kwargs:
            value = kwargs[field.name]
        elif field.default_factory is not dataclasses.MISSING:
            value = field.default_factory()
        elif field.default is not dataclasses.MISSING:
            value = field.default

        if value is dataclasses.MISSING:
            raise KeyError(f"field {field.name} is missing and has no default")

        setattr(instance, field.name, value)

@dataclass
class ModMetadata:
    id: str
    version: str

    _loaded: "ClassVar[ModMetadata|None]" = None

    def __init__(self, /, **kwargs: Any):
        dataclass_init_from_kwargs(self, **kwargs)

    @staticmethod
    def get() -> "ModMetadata":
        import json
        if ModMetadata._loaded is not None:
            return ModMetadata._loaded
        metadata_path = get_root_dir() / "metadata.json"
        metadata = json.loads(metadata_path.read_bytes())
        ModMetadata._loaded = ModMetadata(**metadata)
        return ModMetadata._loaded
