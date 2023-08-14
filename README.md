## Useful Tools
- https://github.com/debauchee/barrier (a KVM switch alternative)
- https://github.com/junegunn/fzf (fuzzy search on terminal and more!)
- https://github.com/tmux/tmux (terminal multiplexer)
    - setting: .tmux.conf file
    - cheatsheet: https://tmuxcheatsheet.com/
- https://github.com/stedolan/jq (found it useful when working with data stored in elasticsearch, take time to learn)

## Gnome extension
![Gnome-Extension](gnome-extension.jpg)

## Useful commands
- Area screenshot and send to system clipboard
    ```
        gnome-screenshot -acf /tmp/tmp.png
    ```

- Switch multi version of a program
    ```
        update-alternatives --config java
    ```

- Remove empty dirs
    ```
    find . -empty -type d -delete
    ```

## Modify terminal behavior
- Show git branch and k8s context and namespace optionally:
    ```
    parse_git_branch() {
        git -C ./ rev-parse 2>/dev/null;
        IS_GIT_REPO=$?;

        if [[ $IS_GIT_REPO -eq 0 ]]
        then
            BRANCH="git-[$(git symbolic-ref HEAD --short)]"
            echo $BRANCH 2> /dev/null | sed -e 's/^/ /'
        fi
    }

    get_k8s_info() {
        if [[ "$ENABLE_K8S_INFO" = true ]]
        then 
            config_name=$(kubectl config view --minify -o jsonpath='{.current-context}')
            namespace_name=$(kubectl config view --minify -o jsonpath='{..namespace}')
            all_info="k8s-[${config_name}|${namespace_name}]"
            echo $all_info 2> /dev/null | sed -e 's/^/ /'
        fi
    }

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
        else
        color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;32m\]$(parse_git_branch)$(get_k8s_info)\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)$(get_k8s_info)\$ '
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