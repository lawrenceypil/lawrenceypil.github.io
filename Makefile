.PHONY: init dev proof release update

init:
	bun install
	bundle install
	pre-commit install

dev:
	bundle exec jekyll serve

proof:
	bundle exec jekyll build
	ruby runHtmlProofer.rb

update:
	bun update
	bun run tinacms dev

release: proof
	npm version minor && \
	./update-robots.sh && \
	git add . && \
	git commit -m "Minor release: v$$(node -p "require('./package.json').version")" && \
	git tag -a v$$(node -p "require('./package.json').version") -m "Release v$$(node -p "require('./package.json').version")" && \
	git push && git push --tags