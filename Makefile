.PHONY: init dev proof update

init:
	bun install
	bundle install
	pre-commit install

dev:
	bundle exec jekyll serve

proof:
	bundle exec jekyll build
	ruby runHtmlProofer.rb

update: proof
	bun update
	bun run tinacms dev