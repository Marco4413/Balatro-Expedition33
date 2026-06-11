from PIL import Image
from pathlib import Path
from . import util

def gen_lune_atlas() -> Path:
    root_dir = util.get_root_dir()
    p_joker  = root_dir / "assets" / "1x" / "jokers" / "lune" / "base.png"
    p_stains = root_dir / "assets" / "1x" / "jokers" / "lune" / "stains.png"
    p_atlas  = root_dir / "assets" / "1x" / "jokers" / "lune.png"

    stains_count: int = 5

    slots: tuple[tuple[int, int], ...] = (
        (20, 47),
        (35, 32),
        (50, 47),
        (35, 62)
    )

    with Image.open(p_joker) as joker, Image.open(p_stains) as stains:
        joker_size = joker.size
        stain_size = ( int(stains.size[0]/stains_count), stains.size[1] )
        atlas_size = ( joker_size[0] * max(1, len(slots)), joker_size[1] * (1+stains_count) )

        atlas = Image.new("RGBA", atlas_size)
        atlas.alpha_composite(joker)

        for stain_idx in range(stains_count):
            source = ( stain_idx*stain_size[0], 0, (stain_idx+1)*stain_size[0], stain_size[1] )
            for slot_idx in range(len(slots)):
                slot = slots[slot_idx]
                dest = (
                    (   slot_idx)*joker_size[0] + slot[0] - int(stain_size[0] / 2),
                    (1+stain_idx)*joker_size[1] + slot[1] - int(stain_size[1] / 2)
                )
                atlas.alpha_composite(stains, dest, source)

        atlas.save(p_atlas)
        print(f"gen: {p_atlas}")

    return p_atlas

if __name__ == "__main__":
    gen_lune_atlas()
