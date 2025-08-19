DOCKER_COMPOSE := docker-compose

OS := $(shell uname)

build:
ifeq ($(OS), Linux)
    @echo "Running on the $(OS)"
    $(DOCKER_COMPOSE) build
endif

ifeq ($(OS), Windows-NT)
    @echo "Please add windows commands"
endif

up:

ifeq ($(OS),Linux)
	@echo "Running for Linux"
	$(DOCKER_COMPOSE) up -d
endif
ifeq ($(OS),Darwin)
	@echo "Running for macOS"
	$(DOCKER_COMPOSE) up -d
endif
ifeq ($(OS),Windows_NT)
	@echo "Running for Windows"
	# Add Windows-specific run commands if you wish :P
endif
    

dowm:
    $(DOCKER_COMPOSE) down

clean:
    $(DOCKER_COMPOSE) rm -f
	docker system prune -f
