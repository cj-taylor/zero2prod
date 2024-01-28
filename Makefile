setup-mac:
	brew install llvm postgresql@15;

setup:
	cargo install cargo-watch cargo-tarpaulin cargo-audit cargo-expand; \
	rustup component add clippy rustfmt; \
	rustup toolchain install nightly --allow-downgrade;

watch: 
	cargo watch -x check -x test -x run

test:
	cargo test

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

expand: 
	cargo +nightly expand

healthcheck:
	curl -v http://127.0.0.1:8000/health_check

ci: check-lint check-format coverage check-audit

start-db: 
	./scripts/init_db.sh

migrate-db:
	SKIP_DOCKER=true ./scripts/init_db.sh