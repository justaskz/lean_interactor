build:
	rm -rf *.gem
	rm -rf pkg
	gem build lean_interactor.gemspec

test:
	@ rspec

release: test build
	@ gem push *.gem
