.PHONY: vim vim-new
.PHONY: start
.PHONY: debug

vim:
	docker build -f docker/vim.Dockerfile -t dockervim:latest .

vim-new:
	docker build -f docker/vim.Dockerfile -t dockervim:latest --no-cache .

start:
	docker run -v $(shell pwd):/mnt -it dockervim:latest
	clear -x

debug:
	docker run --entrypoint /bin/bash -v $(shell pwd):/mnt -it dockervim:latest
