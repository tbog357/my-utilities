## Useful Tools
- https://github.com/junegunn/fzf
- https://github.com/tmux/tmux
    - setting: .tmux.conf file
    - cheatsheet: https://tmuxcheatsheet.com/
- nano
    - setting: .nanorc
- https://github.com/stedolan/jq
    - tutorial: jq.txt
- dconf
    - dconf-dash-to-dock.txt: make dock look like dock on macbook
## Gnome extension
![Gnome-Extension](gnome-extension.jpg)

## Useful screenshot with area
gnome-screenshot -acf /tmp/tmp.png

## Useful commands

- Remove empty dirs
    ```
    find . -empty -type d -delete
    ```
## Modify terminal behavior
- Show branch in a git repository
    ```
    parse_git_branch() {
    git -C ./ rev-parse 2>/dev/null;
    IS_GIT_REPO=$?;

    if [[ $IS_GIT_REPO -eq 0 ]]
    then
            BRANCH=" git-[$(git symbolic-ref HEAD --short)]"
            echo $BRANCH 2> /dev/null | sed -e 's/^/ /'
    fi
    }

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
    fi
    unset color_prompt force_color_prompt
    ```

- Shorten terminal path
    ```
    PROMPT_DIRTRIM=2
    ```

- Cycling autocompletion 
    ```
    bind 'TAB:menu-complete'
    bind '"\e[Z":menu-complete-backward'
    ```