from PIL import Image
from pathlib import Path

ROOT_DIR = Path(__file__).parent.parent.relative_to(Path.cwd(), walk_up=True)

P_JOKER  = ROOT_DIR / "assets" / "1x" / "jokers" / "lune" / "base.png"
P_STAINS = ROOT_DIR / "assets" / "1x" / "jokers" / "lune" / "stains.png"
P_ATLAS  = ROOT_DIR / "assets" / "1x" / "jokers" / "lune.png"

STAINS_START: int = 1
STAINS_COUNT: int = 6

SLOTS: tuple[tuple[int, int], ...] = (
    (21, 47),
    (35, 33),
    (49, 47),
    (35, 61)
)

assert len(SLOTS) > 0

with Image.open(P_JOKER) as joker, Image.open(P_STAINS) as stains:
    joker_size = joker.size
    stain_size = ( int(stains.size[0]/STAINS_COUNT), stains.size[1] )
    atlas_size = ( joker_size[0] * len(SLOTS), joker_size[1] * STAINS_COUNT )

    atlas = Image.new("RGBA", atlas_size)
    atlas.alpha_composite(joker)

    for stain_idx in range(STAINS_START, STAINS_COUNT):
        source = ( stain_idx*stain_size[0], 0, (stain_idx+1)*stain_size[0], stain_size[1] )
        for slot_idx in range(len(SLOTS)):
            slot = SLOTS[slot_idx]
            dest = (
                slot_idx *joker_size[0] + slot[0] - int(stain_size[0] / 2),
                stain_idx*joker_size[1] + slot[1] - int(stain_size[1] / 2)
            )
            atlas.alpha_composite(stains, dest, source)

    atlas.save(P_ATLAS)
    print(P_ATLAS)
