BINARY_NAME=task-3-5
PLATFORMS=linux windows darwin
ARCHS=amd64 arm64

define BUILD_TARGET
  $(eval OS=$1)
  $(eval ARCH=$2)
  $(BINARY_NAME)-$(OS)-$(ARCH)
endef

# Build rules for all targets
all: $(foreach OS,$(PLATFORMS),$(foreach ARCH,$(ARCHS),$(call BUILD_TARGET,$(OS),$(ARCH))))

$(foreach OS,$(PLATFORMS),$(foreach ARCH,$(ARCHS),$(eval $(call BUILD,$(OS),$(ARCH)))))

define BUILD
$(BINARY_NAME)-$(1)-$(2):
	GOOS=$(1) GOARCH=$(2) go build -o bin/$(BINARY_NAME)-$(1)-$(2)
	@echo "Built for $(1)/$(2)"
endef

# Docker image build target
.PHONY: image
image:
	docker build -t $(BINARY_NAME) .
	@echo "Docker image built"

# Clean build artifacts
.PHONY: clean
clean:
	rm -rf bin/
	@echo "Cleaned build files"

# Clean Docker images
.PHONY: docker-clean
docker-clean:
	docker rmi $(BINARY_NAME)
	@echo "Docker image removed"