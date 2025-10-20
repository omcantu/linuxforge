#!/usr/bin/env fish
# Larger helper functions converted from bash functions

function compress
    if test (count $argv) -eq 0
        echo "Usage: compress <dir>"
        return 1
    end
    set dir $argv[1]
    set base (string replace -r '/$' '' $dir)
    tar -czf "$base.tar.gz" "$dir"
end

function decompress
    if test (count $argv) -eq 0
        echo "Usage: decompress <archive.tar.gz>"
        return 1
    end
    tar -xzf $argv
end

# Create a desktop launcher for a web app
function web2app
    if test (count $argv) -ne 3
        echo "Usage: web2app <AppName> <AppURL> <IconURL> (IconURL must be in PNG -- use https://dashboardicons.com)"
        return 1
    end

    set -l APP_NAME $argv[1]
    set -l APP_URL $argv[2]
    set -l ICON_URL $argv[3]
    set -l ICON_DIR $HOME/.local/share/applications/icons
    set -l DESKTOP_FILE $HOME/.local/share/applications/$APP_NAME.desktop
    set -l ICON_PATH $ICON_DIR/$APP_NAME.png

    mkdir -p $ICON_DIR

    if not curl -sL -o $ICON_PATH $ICON_URL
        echo "Error: Failed to download icon."
        return 1
    end

    printf '%s\n' "[Desktop Entry]" "Version=1.0" "Name=$APP_NAME" "Comment=$APP_NAME" \
        "Exec=google-chrome --app=\"$APP_URL\" --name=\"$APP_NAME\" --class=\"$APP_NAME\" --window-size=800,600" \
        "Terminal=false" "Type=Application" "Icon=$ICON_PATH" "Categories=WebApps;Internet;" \
        "MimeType=text/html;text/xml;application/xhtml_xml;" "StartupNotify=true" > $DESKTOP_FILE

    chmod +x $DESKTOP_FILE
end

function web2app-remove
    if test (count $argv) -ne 1
        echo "Usage: web2app-remove <AppName>"
        return 1
    end

    set -l APP_NAME $argv[1]
    set -l ICON_DIR $HOME/.local/share/applications/icons
    set -l DESKTOP_FILE $HOME/.local/share/applications/$APP_NAME.desktop
    set -l ICON_PATH $ICON_DIR/$APP_NAME.png

    if test -f $DESKTOP_FILE
        rm $DESKTOP_FILE
    end
    if test -f $ICON_PATH
        rm $ICON_PATH
    end
end
