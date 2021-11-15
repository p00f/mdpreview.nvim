default:
	fennel --globals vim --compile fnl/mdpreview.fnl > lua/mdpreview.lua
clean:
	rm lua/mdpreview.lua
