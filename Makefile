#Makefiles rule the world
DOCKER = $(shell which docker)
CONTAINER = siege-container
NAMESPACE = lukasbahr

all: build push

build: 
	$(DOCKER) $(@) --build-arg VERSION=$(OSVERSION) --build-arg SIEGE=$(SIEGE) -t $(NAMESPACE)/$(CONTAINER):$(SIEGE) .

push: 
	$(DOCKER) $(@) $(NAMESPACE)/$(CONTAINER):$(SIEGE)
