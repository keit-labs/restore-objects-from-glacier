SHELL = /bin/bash
SHELLFLAGS = -ex

help: ## Get help about Makefile commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install-dev: ## Install project dependencies using pipenv
	pipenv install --dev

shell: ## Spawn a shell in the current virtual environment
	pipenv shell


# Currently distributed maps are not supported https://github.com/awslabs/statelint/issues/51
lint-statemachine: # Lints the statemachine for syntax errors	
	pipenv run statelint --ignore=URI statemachines/*

lint-yaml:
	pipenv run yamllint *.yaml
	pipenv run yamllint .github/workload/*.yml
