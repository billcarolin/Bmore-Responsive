#
vpc_cidr = "20.0.0.0/16"
public_subnet_cidrs = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]
private_subnet_cidrs = ["20.0.40.0/24", "20.0.50.0/24", "20.0.60.0/24"]
ecs_cluster_name = "bmore-responsive-prod-cluster"
ecs_service_name = "bmore-responsive"
docker_container_port = 3000
internet_cidr_blocks = "0.0.0.0/0"
public_hosted_zone_name = "bmoreres.codeforbaltimore.org"
#for cfb
zone_id                 = "Z01109461TXLDIDM3AT52"

#TODO -- What value to use here?
api_url = "bmoreres.codeforbaltimore.org/api"

#TODO - store these in secrets manager
db_password = null
smtp_password = null
jwt_key = null
