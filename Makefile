init:
	bun install
	bundle install
	pre-commit install

dev:
	bundle exec jekyll serve