.PHONY: init dev proof

init:
	bun install
	bundle install
	pre-commit install

dev:
	bundle exec jekyll serve

proof:
	bundle exec jekyll build
	ruby runHtmlProofer.rb