git clone https://github.com/pc-ego/zammad-docker-compose.git
cd zammad-docker-compose
az group create --name zammad-group --location "West Europe"
az appservice plan create --name zammad-plan --resource-group zammad-group --sku P1V2 --is-linux
az webapp create --resource-group zammad-group --plan zammad-plan --name pcego-zammad --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml
