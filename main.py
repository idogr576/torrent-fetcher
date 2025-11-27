import asyncio
import shutil
from pathlib import Path
from typing import Generator
from torrentp import TorrentDownloader


MOVIES_PATH = Path("/movies")
TORRENTS_PATH = Path("/torrents")


def discover_torrent_file() -> Generator[Path]:
    for torrent_file in TORRENTS_PATH.iterdir():
        if not torrent_file.is_file() or not torrent_file.suffix == ".torrent":
            continue
        print(f"discovered torrent {torrent_file.name}")
        yield torrent_file


def download_torrent_file(torrent_file: Path):
    torrent = TorrentDownloader(torrent_file.as_posix(), MOVIES_PATH.as_posix())
    print(f"downloading torrent {torrent_file.name}")
    return asyncio.run(torrent.start_download())
    

def main():
    for torrent_file in discover_torrent_file():
        download_torrent_file(torrent_file)
        print(f"moving {torrent_file.name} to \"Done\" directory")
        shutil.move(torrent_file, "Done" / torrent_file)

if __name__ == "__main__":
    main()
