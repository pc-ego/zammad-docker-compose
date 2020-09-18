git clone https://github.com/pc-ego/zammad-docker-compose.git
cd zammad-docker-compose
az group create --name zammad-group --location "West Europe"
az appservice plan create --name zammad-plan --resource-group zammad-group --sku P1V2 --is-linux
az webapp create --resource-group zammad-group --plan zammad-plan --name pcego-zammad --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml
# Attivare la registrazione del contenitore
az webapp log config --name pcego-zammad --resource-group zammad-group --docker-container-logging filesystem
# Abilitare lo streaming dei log
az webapp log tail --name pcego-zammad --resource-group zammad-group
#È anche possibile esaminare i file di log nel browser all'indirizzo https://pcego-zammad.scm.azurewebsites.net/api/logs/docker
