## Useful commands

- Remove empty dirs
    ```
    find . -empty -type d -delete
    ```
## Show git branch in terminal (place in .bashrc)
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