# Help generator
help: ## Display this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


run: ## Run Jekyll server.
	docker compose run --rm -p 5001:4000 jekyll

build: ## Build Docker images.
	docker compose build

up: ## Start Jekyll service in detached mode.
	docker compose up -d jekyll

down:  ## Stop Jekyll service.
	docker compose down

test: ## Test Jekyll site.
	$(MAKE) build
# 	$(MAKE) up
# 	# Wait up to 60 seconds for Jekyll to serve index.html
# 	for i in $$(seq 1 60); do \
# 		curl -sf http://localhost:5001/index.html && break; \
# 		sleep 1; \
# 	done
# 	curl -sfI http://localhost:5001/index.html
# 	curl -sfI http://localhost:5001/en.html
# 	curl -sfI http://localhost:5001/gr.html
# 	curl -sfI http://localhost:5001/company-info.html
# 	curl -sfI http://localhost:5001/company-info_gr.html
# 	curl -sfI http://localhost:5001/partners-management.html
# 	curl -sfI http://localhost:5001/partners-management_gr.html
# 	curl -sfI http://localhost:5001/financial-statements.html
# 	curl -sfI http://localhost:5001/financial-statements_gr.html
# 	curl -sfI http://localhost:5001/privacy.html
# 	curl -sfI http://localhost:5001/privacy_gr.html
# 	curl -fsS http://localhost:5001/gr.html | grep -q "Markoulis Works"
# 	$(MAKE) down

.PHONY: $(shell grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | cut -d ':' -f 1)