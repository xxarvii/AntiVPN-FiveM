
# Anti VPN FiveM

A brief description of what this project does and who it's for


## Usage/Examples


Important : Avant de procéder, assurez-vous d'avoir les compétences nécessaires en programmation et que vous comprenez les implications juridiques et éthiques de la détection et du blocage des VPN. De plus, les méthodes de détection de VPN peuvent ne pas être à 100% efficaces, car les technologies VPN évoluent constamment.

```javascript
Étape 1 : Créer le script Lua Créez un nouveau fichier Lua dans votre répertoire de scripts FiveM (généralement resources/[nom_de_votre_script]) et nommez-le anti-vpn.lua.
```

```javascript
Étape 2 : Insérer le code Insérez le code suivant dans votre fichier anti-vpn.lua. Ce code utilise l'API GetPlayerIdentifiers pour récupérer les informations d'identification du joueur, y compris son adresse IP, et vérifie si l'adresse IP est associée à un fournisseur de services VPN en utilisant une API de vérification de VPN.
```

```javascript
Étape 3 : Configurer le script Assurez-vous d'avoir remplacé https://api.vpnapi.io/api/v1/ip/ par l'URL réelle de l'API de vérification de VPN que vous utilisez. Vous devrez peut-être créer un compte ou obtenir une clé API pour utiliser certaines API.
```
```javascript
Étape 4 : Ajouter le script à votre serveur Placez le script dans votre répertoire de resources, puis ajoutez-le à votre fichier server.cfg : "ensure anti-vpn" Redémarrez votre serveur pour que les changements prennent effet.
```


Note : Ce script est un exemple de base et peut nécessiter des adaptations pour fonctionner correctement avec votre serveur et l'API de vérification de VPN que vous choisissez d'utiliser.
## Authors

- [@xxarvii](https://github.com/xxarvii)


## Support

En cas de problèmes venez sur https://discord.gg/2727

