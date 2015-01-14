all: bug

build:
	docker build -t 'gdsfmt_bug' .

bug: build
	docker run -ti gdsfmt_bug


