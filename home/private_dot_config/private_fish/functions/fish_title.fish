function fish_title
    set -q argv[1]; or set argv fish
    echo (prompt_pwd --full-length-dirs=2 --dir-length=1): $argv;
end
