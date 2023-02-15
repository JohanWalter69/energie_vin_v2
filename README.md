1.// Récupérer le projet en le clonant avec le repo public //
mkdir ~/code/OWNER_GITHUB_USERNAME
cd ~/code/OWNER_GITHUB_USERNAME
gh repo clone JohanWalter69/energie_vin
cd energie_vin

2.// Les gems utilisées //
Lancer bundle install / yarn install et vérifier que les gems suivantes sont disponibles, sinon lancer :
gem install 'nokogiri'
gem install 'open-uri'
gem insall 'devise'

3.// Création et migration de la DB //
rails db:create
rails db:migrate 

4.// Lancer la seed //
rails db:seed

Si scraping online impossible => télécharger la page en local
curl -H "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0"  https://www.wineandco.com/vins > results.html
# energie_vin_v2
