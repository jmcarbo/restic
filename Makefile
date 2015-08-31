.PHONY: all clean test

all: restic

restic: $(SOURCE)
	go run build.go

clean:
	rm -rf restic

test: $(SOURCE)
	go run run_tests.go /dev/null

buildunix:
	docker run -ti  -v "$(PWD)":/usr/src/restic -w /usr/src/restic golang:1.5 go run build.go

