.PHONY: init dev proof release update

init:
	bun install
	bundle install
	pre-commit install

dev:
	bundle exec jekyll serve

proof:
	bundle exec jekyll build
	ruby scripts/runHtmlProofer.rb

update:
	bun update
	bun run tinacms dev

release: proof
	./scripts/update-robots.sh && \
	if ! git diff --quiet; then \
		git add . && \
		git commit -m "Update files before version bump"; \
	fi && \
	npm version minor && \
	git push && git push --tags