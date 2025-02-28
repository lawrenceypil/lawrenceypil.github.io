require "html-proofer"

options = {
    ignore_urls: [
        /[\S]*archive.md[\S]*/,
        /[\S]*web.archive.org[\S]*/,
        /[\S]*tandfonline.com[\S]*/
    ],
    ignore_files: [
        /[\S]*_site\/admin\/[\S]*/
    ],
    cache: {
        timeframe: {
            external: "2w"
        }
    }
}

HTMLProofer.check_directory("./_site", options).run