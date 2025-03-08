function ciel-updpkgsums
    if test (count $argv) -ne 1
        echo "Usage: ciel-updpkgsums <package-name>"
        return 1
    end

    set package_name $argv[1]
    sudo ciel shell -- acbs-build -gw $package_name
end
