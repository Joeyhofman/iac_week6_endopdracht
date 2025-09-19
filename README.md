# iac_week6_endopdracht

Dit is de eindopdracht voor IAC (infrastructure as code). Deze repository voeg alle onderdleen van de voorgaande lessen samen in een compleet geautomatiseerde deployment.

## Inhoudsopgave
- [iac\_week6\_endopdracht](#iac_week6_endopdracht)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Installatie](#installatie)
  - [Gebruik](#gebruik)
  - [Ontwikkelen](#ontwikkelen)
    - [prerequisites](#prerequisites)
    - [Richtlijnen](#richtlijnen)
  - [Testen](#testen)
  - [Bijdragen](#bijdragen)
  - [Licentie](#licentie)


## Installatie
1. Clone de repository:
met SSH: 
``` bash
git clone git@github.com:Joeyhofman/iac_week6_endopdracht.git
cd iac_week6_endopdracht
```

of het HTTPS
``` bash
git clone https://github.com/Joeyhofman/iac_week6_endopdracht.git
cd iac_week6_endopdracht
```
2. Terraform initialiseren
``` bash
terraform init
```

## Gebruik
Om de VMs uit te rollen op ESXI en Azure gebruik:
``` bash
terraform apply
```
Vervolgens kan de applicatie geinstalleerd worden:
``` bash
ansible-playbook -i inventory.ini playbooks/deploy_app.yml
```

## Ontwikkelen

### prerequisites
- Ansible `2.18.8`
- OVF-tool `4.6.3`
- Azure CLi `2.77.0` (met ingelogde gebruiker (zie [Installeren Azure CLI](https://learn.microsoft.com/nl-nl/cli/azure/install-azure-cli?view=azure-cli-latest)))

### Richtlijnen
**branch conventie**: gebruik conventional branches (feat/branch_naam, chore/branch_naam, bugfix/branch_naam) 
**commitconventie**: gebruik conventional commits (bijv. chore: fixed typo in README.md) 
**testen**: test code voordat er gecommit wordt. Dit wordt ook door de pre-commit hook gedaan.


## Testen
Testen wordt op een aantal manier gedaan:
1. **terraform validate** valideert de terraform code:
``` bash
terraform validate
```
2. YAML lint:
 ``` bash
yamllint .
```

## Bijdragen
Zie [`CONTRIBUTING.md`](CONTRIBUTING.md) voor richtlijnen.

## Licentie
Dit project is gelicentieerd onder <LICENTIE>. Zie [`LICENSE`](LICENSE).