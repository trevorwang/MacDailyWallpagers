# MacDailyWallpagers

`rb-appscript` lib will be used for apply the settings to mac os. So you must install the lib first with command `gem update --system && gem install rb-appscript`

use `crontab -e` to edit the cron config file, add the following code
```
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
0 12 * * * ruby /Users/mingwan/bin/daily_wallpapers.rb > /tmp/crontabxx.log
```