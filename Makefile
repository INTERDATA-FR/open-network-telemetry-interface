include params

build: build-grafana build-influxdb build-telegraf

build-grafana:
	@echo "======================================================================"
	@echo "  ____  _    _ _____ _      _____  "
	@echo " |  _ \| |  | |_   _| |    |  __ \ "
	@echo " | |_) | |  | | | | | |    | |  | |"
	@echo " |  _ <| |  | | | | | |    | |  | |"
	@echo " | |_) | |__| |_| |_| |____| |__| |"
	@echo " |____/ \____/|_____|______|_____/ "
	@echo "                                   "
	@echo " Docker image - $(GRAFANA_IMAGE_NAME):$(GRAFANA_IMAGE_VERSION)"
	@echo "======================================================================"
	docker build \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg GRAFANA_VERSION=$(GRAFANA_IMAGE_VERSION) \
		-t $(GRAFANA_IMAGE_NAME):$(GRAFANA_IMAGE_VERSION) \
		$(GRAFANA_DOCKERFILE)

build-influxdb:
	@echo "======================================================================"
	@echo "  ____  _    _ _____ _      _____  "
	@echo " |  _ \| |  | |_   _| |    |  __ \ "
	@echo " | |_) | |  | | | | | |    | |  | |"
	@echo " |  _ <| |  | | | | | |    | |  | |"
	@echo " | |_) | |__| |_| |_| |____| |__| |"
	@echo " |____/ \____/|_____|______|_____/ "
	@echo "                                   "
	@echo " Docker image - $(INFLUXDB_IMAGE_NAME):$(INFLUXDB_IMAGE_VERSION)"
	@echo "======================================================================"
	docker build \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg INFLUXDB_VERSION=$(INFLUXDB_IMAGE_VERSION) \
		-t $(INFLUXDB_IMAGE_NAME):$(INFLUXDB_IMAGE_VERSION) \
		$(INFLUXDB_DOCKERFILE)

build-telegraf:
	@echo "======================================================================"
	@echo "  ____  _    _ _____ _      _____  "
	@echo " |  _ \| |  | |_   _| |    |  __ \ "
	@echo " | |_) | |  | | | | | |    | |  | |"
	@echo " |  _ <| |  | | | | | |    | |  | |"
	@echo " | |_) | |__| |_| |_| |____| |__| |"
	@echo " |____/ \____/|_____|______|_____/ "
	@echo "                                   "
	@echo " Docker image - $(TELEGRAF_IMAGE_NAME):$(TELEGRAF_IMAGE_VERSION)"
	@echo "======================================================================"
	docker build \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg TELEGRAF_VERSION=$(TELEGRAF_IMAGE_VERSION) \
		-t $(TELEGRAF_IMAGE_NAME):$(TELEGRAF_IMAGE_VERSION) \
		$(TELEGRAF_DOCKERFILE)

clean-all:
	./_scripts/docker-clean-all.sh

reset:
	@echo "============================================================"
	@echo "DOCKER RESET - $(DOCKER_FILE)"
	@echo "============================================================"
	docker-compose -f $(DOCKER_FILE) stop
	docker-compose -f $(DOCKER_FILE) start

restart:
	@echo "============================================================"
	@echo "DOCKER RESTART - $(DOCKER_FILE)"
	@echo "============================================================"
	docker-compose -f $(DOCKER_FILE) restart

start:
	@echo "============================================================"
	@echo "DOCKER START - $(DOCKER_FILE)"
	@echo "============================================================"
	docker-compose -f $(DOCKER_FILE) up -d

stop:
	@echo "============================================================"
	@echo "DOCKER STOP - $(DOCKER_FILE)"
	@echo "============================================================"
	docker-compose -f $(DOCKER_FILE) stop