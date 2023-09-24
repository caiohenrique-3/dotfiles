config.load_autoconfig(False)

# User scripts:

# -- SwapForQute
sfq_base_dir = "~/.config/qutebrowser/userscripts/swapforqute/"
sfq_script_path = sfq_base_dir + "main.py"
sfq_conf_path = sfq_base_dir + "config.json"
sfq_cmd = "--userscript {} -c {}".format(sfq_script_path, sfq_conf_path)
c.aliases['sfq'] = "set-cmd-text -s :spawn {} --cmd 'open' -u ".format(sfq_cmd)

# -- pywalQute
import pywalQute.draw

pywalQute.draw.color(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Auto-generated config:
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/unknown/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/unknown/.local/share/qutebrowser/userscripts/*')

# Custom Keybidings:
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

config.unbind('<Space>', mode="caret")
config.unbind('r')
config.bind('<Space>rr', 'reload')
config.bind('<Space>qq', 'quit')
config.bind('<Space>M', 'hint links spawn mpv {hint-url}')
config.bind('<Space>m', 'spawn mpv {url}')

config.bind('<Space>je', 'set content.javascript.enabled true')
config.bind('<Space>jd', 'set content.javascript.enabled false')

# Default keybinds helper
config.bind('<Space>hb', 'open -t qute://help/img/cheatsheet-big.png')

# Go back in the history of the current tab.
# (like kill buffer, because usually this fall back to the previous buffer)
config.bind('<Space>bk', 'back')

# Open a blank page in a new tab
config.bind('<Space>bn', 'open -t about:blank')

# Show all bookmarks/quickmarks
config.unbind('Sb') # --jump
config.unbind('Sq') # no jump; what the hell is this jump flag anyway?
config.bind('<Space><Return>', 'bookmark-list --jump')

# Show browsing history
config.unbind('Sh')
config.bind('<Space>h', 'history')

# Set an option
config.unbind('Ss')
# config.bind('<Space>ss', 'set')

# Start or stop recording a macro
config.unbind('q')
# config.bind('<Space>q', 'macro-record')

# Replace URLs from link hints
# Below breaks some pages, so use 'wf' bind when it happens.
# Tends to solve it the problem.
config.bind('f', "hint links spawn {} --cmd 'open' -u ".format(sfq_cmd) + " {hint-url}")
config.bind('F', "hint links spawn {} --cmd 'open -t' -u ".format(sfq_cmd) + " {hint-url}")

# General:
config.set('tabs.show', 'multiple')
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
    "libr": "https://libreddit.freedit.eu/r/{}"
}

config.set('downloads.location.directory', '~/HD/downloads/')

# Privacy:
config.set('content.blocking.method', 'both') # python-adblock needed.
config.set("content.cookies.store", True)
config.set('content.cookies.accept', 'never')
config.set('content.cookies.accept', 'no-3rdparty', 'https://github.com/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://proton.me/')
config.set('content.cookies.accept', 'no-3rdparty', 'https://account.proton.me')
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
config.set('content.javascript.enabled', False)

# Set the user agent to Windows 10 with Google Chrome 
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.headers.accept_language = "en-US,en;q=0.5"

