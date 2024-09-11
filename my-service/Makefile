all: is-odd-lambda is-odd-layer

is-odd-lambda:
	cd src/handlers/is-odd-lambda && npm install && npm run build

is-odd-layer:
	cd src/layers/util-layer/nodejs && npm install
	cd src/handlers/is-odd-lambda && npm run layer:build


