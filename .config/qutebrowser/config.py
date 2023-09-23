config.load_autoconfig(False)

config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/unknown/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/unknown/.local/share/qutebrowser/userscripts/*')

# Custom Keybidings
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('m', 'spawn mpv {url}')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('<Space>qq', 'quit')

# If a site is broken, re-enable it for the current tab
config.bind('xj', 'set content.javascript.enabled true')
config.bind('<Space>xj', 'set content.javascript.enabled false')

# General 
config.set('fonts.default_family', 'JetBrainsMono Nerd Font')
config.set('colors.webpage.darkmode.enabled', True)
config.set('confirm_quit', ['multiple-tabs'])
config.set('content.autoplay', False)
config.set('url.default_page', 'about:blank')
config.set('url.start_pages', ['about:blank'])

c.url.searchengines = {
    "DEFAULT": "https://searx.work/search?q={}",
    "y": "https://vid.puffyan.us/search?q={}",
    "wiki": "https://en.wikipedia.org/wiki/{}",
    "aw": "https://wiki.archlinux.org/index.php?search={}",
    "b": "https://search.brave.com/search?q={}",
    "d": "https://duckduckgo.com/?q={}",
    "r": "https://old.reddit.com/r/{}",
}

config.set('downloads.location.directory', '~/HD/downloads/')

# Privacy 
config.set("content.cookies.store", True)
#config.set('content.cookies.accept', 'never', '*')
config.set('content.cookies.accept', 'no-3rdparty', 'https://github.com/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://proton.me/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://account.proton.me')
config.set('content.cookies.accept', 'no-3rdparty', 'https://www.twitch.tv/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://roadmap.sh/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://chat.openai.com/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://anilist.co')
config.set('content.cookies.accept', 'no-3rdparty', 'https://www.nexusmods.com/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://vid.puffyan.us')
config.set('content.cookies.accept', 'no-3rdparty', 'https://searx.work')


config.set("completion.web_history.max_items", 0)
config.set("completion.cmd_history_max_items", 35)

config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set('content.headers.referer', 'same-domain')
config.set("content.headers.accept_language", 'en-US')
config.set('content.javascript.enabled', False)

# Set the user agent to Windows 10 with Google Chrome 
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'
