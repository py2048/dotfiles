require('code_runner').setup({
    -- put here the commands by filetype
    mode = 'float',
    startinsert = true,
    filetype = {
        c = "gcc $file -o $dir/fileNameWithoutExt && $dir/fileNameWithoutExt",
        cpp = "g++ $file -o $dir/fileNameWithoutExt && $dir/fileNameWithoutExt",
        fortran = "ifort $file -o $dir/fileNameWithoutExt && $dir/fileNameWithoutExt",
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u $file",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		typescript = "deno run",
        sh = "bash $file",
        bash = "bash $file",
        zsh = "zsh $file",
	},
    float = {
        border = 'rounded',
    },
})

vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
