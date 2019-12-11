# daily-bing-wallpaper
A script to download and set daily bing image as wallpaper

## Environment
I test the script in `Ubuntu 18.04LTS`, and it works fine.

## Install
No need to install.

## Usage

There are two ways to use this script:

### Manually
```
bash -c "$(curl -f https://raw.githubusercontent.com/yongcongwang/daily-bing-wallpaper/master/daily_bing_wallpaper.sh)"
```

This will download today's bing wallpaper to `~/Pictures/bing` folder as `${DATE}.jpg` file. 
And then, you can see the wallpaper changed.

### Automatically
To automatically run the script, you can add it to `crontab`:
1. run:
```
crontab -e
```
2. add the job at the bottom, for example, run the script every 3 hours:

```
* */3 * * * bash -c "$(curl -f https://raw.githubusercontent.com/yongcongwang/daily-bing-wallpaper/master/daily_bing_wallpaper.sh)"
```

### Bugs
May not work in `Unity`, even though I have set the job. If that happens, you can set `~/Pictures/wallpaper.jpg` as wallpaer in your `system settings`. `wallpaper.jpg` is a soft-link that always links to the latest bing-wallpaper.
