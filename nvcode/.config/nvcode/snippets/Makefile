UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
	target = ~/.config
endif
ifeq ($(UNAME), Darwin)
	target = ~/Library/Application\ Support/Code/User/snippets
endif

src = $(shell pwd)/src

$(target): $(src)
	ln -s $(src) $(target)

clean: $(target)
	rm -r $(target)
