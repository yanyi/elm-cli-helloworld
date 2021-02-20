src/Main.elm:
	elm make src/Main.elm --output=build/app.js

compile: src/Main.elm
	@echo "Compiling..."
