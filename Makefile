setup-mac:
	brew install llvm;

setup:
	cargo install cargo-watch cargo-tarpaulin cargo-audit; \
	rustup component add clippy rustfmt; 

watch: 
	cargo watch -x check -x test -x run

coverage:
	cargo tarpaulin --ignore-tests

lint:
	cargo clippy

format:
	cargo fmt

check-lint:
	cargo clippy -- -D warnings

check-format: 
	cargo fmt -- --check

check-audit: 
	cargo audit

ci: check-lint check-format check-audit