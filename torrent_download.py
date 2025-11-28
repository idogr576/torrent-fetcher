import asyncio
import sys
from pathlib import Path
from torrentp import TorrentDownloader


MOVIES_PATH = Path("/movies")
TORRENTS_PATH = Path("/torrents")


def is_torrent_file(torrent_file: Path) -> bool:
    return torrent_file.is_file() and torrent_file.suffix == ".torrent"


def download_torrent_file(torrent_file: Path):
    torrent = TorrentDownloader(torrent_file.as_posix(), MOVIES_PATH.as_posix())
    print(f"downloading torrent {torrent_file.name}")
    return asyncio.run(torrent.start_download())


def main():
    if len(sys.argv) != 2:
        print("script must be run using one arg")
    torrent_file = Path(sys.argv[1])
    if not is_torrent_file(torrent_file):
        print("arg must be a valid torrent file")

    download_torrent_file(Path(torrent_file))


if __name__ == "__main__":
    main()
