src/Main.elm:
	elm make src/Main.elm --output=build/app.js

compile: src/Main.elm
	@echo "Compiling..."

prod: UGLIFY_CMD=./node_modules/.bin/uglifyjs
prod:
	elm make src/Main.elm --optimize --output=build/app.js
	${UGLIFY_CMD} build/app.js --compress \
		"pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe" \
		\
		| ${UGLIFY_CMD} --mangle --output build/app.min.js
.PHONY: prod