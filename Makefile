init:
	git submodule init
	git submodule update
	git submodule update --init --recursive
test:
	hugo server -w -v --enableGitInfo --bind=0.0.0.0 --port 8080 --navigateToChanged
publish:
	hugo -D
	hugo deploy
