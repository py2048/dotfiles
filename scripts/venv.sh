venv(){
    if [[ -d "venv" ]]; then
        source venv/bin/activate
        python /Users/minhquandoan/Desktop/Executable/pyversion.py
    else
        echo "venv not found"
    fi
}
