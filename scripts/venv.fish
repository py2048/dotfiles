function venv
    if test -d ./venv
        source ./venv/bin/activate.fish
        python /Users/minhquandoan/Desktop/Executable/pyversion.py
    else
        echo "venv does not exist"
    end
end
