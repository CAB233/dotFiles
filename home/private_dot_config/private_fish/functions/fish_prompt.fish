# based on Astronaut prompt

function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color $fish_color_status)
    set -l cwd_color (set_color $fish_color_cwd)

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color git
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch brmagenta
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate brgreen
    end

    echo -s (prompt_login) ' ' $cwd_color (prompt_pwd) $normal (__fish_git_prompt)
    echo -n -s $status_color $suffix ' ' $normal
end
