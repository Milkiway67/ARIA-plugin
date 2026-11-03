# ARIA — Transformer l’évaluation à l’ère de l’IA

ARIA est un ensemble d’**instructions pédagogiques** (une compétence ou *skill*) et de **20 documents de référence**. Il sert à configurer un assistant conversationnel qui aide les enseignant·es de l’enseignement supérieur à repenser leurs évaluations dans un contexte où les étudiant·es utilisent l’IA.

**Autrice : Sandrine DECAMPS.** Langue : français.

> **En bref.** Ce n’est pas un logiciel. Il n’y a ni code, ni serveur, ni clé API. Le plugin s’installe directement dans **Claude** et dans **ChatGPT**. Pour les autres outils (Copilot, Gemini, Le Chat…), vous recréez l’assistant à la main : vous copiez les instructions et vous ajoutez les documents. Voir [Installation selon votre outil](#installation-selon-votre-outil).

---

## Ce que fait l’assistant

Il guide l’enseignant·e en **quatre étapes** (modèle ARIA) :

| Étape | Objectif |
| --- | --- |
| 1. **Analyser** | Repérer les fragilités de l’évaluation actuelle : validité, alignement, tâches faciles à automatiser. |
| 2. **Repenser** | Concevoir des tâches authentiques et inclusives, et reformuler les objectifs (taxonomie de Bloom adaptée à l’IA). |
| 3. **Intégrer** | Encadrer l’usage des outils numériques et de l’IA de façon transparente et traçable. |
| 4. **Accompagner** | Développer chez les étudiant·es les compétences humaines et la littératie IA. |


### Limites à connaître

- **Le guide pédagogique ARIA n’est pas lisible par tous les outils.** Le fichier *Guide pédagogique Cadre ARIA* (22 pages) est composé d’images et ne contient presque pas de texte. Un outil qui ne lit que le texte des PDF ne peut pas l’exploiter. Les instructions prévoient alors de s’appuyer sur l’article qui présente le modèle ARIA.
- **Les documents sont volumineux** : environ 54 Mo au total, dont trois fichiers de plus de 8 Mo. Certains outils limitent la taille ou le nombre des fichiers qu’on peut joindre.
- **Les présentations (`.pptx`) ne sont pas lisibles partout.** Si votre outil refuse ce format, exportez-les en PDF.
- **La qualité des réponses dépend du modèle d’IA** utilisé. Comme pour tout assistant génératif, vérifiez les références et les propositions avant de les utiliser.

---

## Installation selon votre outil

| Outil | Méthode | Effort |
| --- | --- | --- |
| Claude / ChatGPT | Installation du plugin depuis le catalogue du dépôt | Faible |
| Autres assistants configurables | Copier les instructions et joindre les documents | Moyen |

Pour les méthodes manuelles, commencez par récupérer le dépôt. Sur [la page du dépôt](https://github.com/Milkiway67/ARIA-plugin), cliquez sur **Code → Download ZIP** puis décompressez l’archive. Vous pouvez aussi le cloner :

```bash
git clone https://github.com/Milkiway67/ARIA-plugin.git
```

### 1. Claude Code : installation du plugin

Dans une session Claude Code, ajoutez le catalogue du dépôt puis installez le plugin :

```
/plugin marketplace add Milkiway67/ARIA-plugin
```

```
/plugin install aria@aria
```

Les versions récentes de Claude Code (2.1.275 et suivantes) font les deux opérations en une seule commande :

```
/plugin install aria --marketplace Milkiway67/ARIA-plugin
```

**Import manuel d’un ZIP.** Vous pouvez aussi importer une archive ZIP du plugin dans les réglages des plugins de Claude. L’archive produite par **Code → Download ZIP** sur GitHub convient à partir de la version 0.48.1. Le plus simple est de télécharger directement **[aria-claude.zip](https://github.com/Milkiway67/ARIA-plugin/releases/latest/download/aria-claude.zip)** (dernière version). Les archives des versions précédentes sont disponibles sur la [page des versions](https://github.com/Milkiway67/ARIA-plugin/releases).

Ouvrez ensuite une nouvelle session. La compétence `aria` se déclenche quand vous parlez d’évaluation et d’IA ; vous pouvez aussi l’appeler explicitement par son nom. Les manifestes se trouvent dans [`.claude-plugin/`](.claude-plugin/).

### 2. ChatGPT / Codex : installation du plugin

1. Ajoutez le dépôt comme source de plugins :

   ```bash
   codex plugin marketplace add Milkiway67/ARIA-plugin
   ```

2. Si vous utilisez l’application de bureau, redémarrez-la si nécessaire.
3. Ouvrez le répertoire des plugins et choisissez la source **ARIA**.
4. Installez **ARIA – Évaluation et IA**, puis ouvrez un nouveau chat.

Remarques :

- La commande et les menus peuvent changer selon votre version de Codex. Consultez la [documentation officielle sur les plugins](https://developers.openai.com/plugins/build/plugins).
- Ce catalogue est propre au dépôt. Le plugin n’est **pas** publié dans le répertoire public d’OpenAI.
- Les réglages de votre organisation peuvent bloquer l’installation de plugins provenant de catalogues tiers.

**Import manuel d’un ZIP dans ChatGPT.** N’importez **pas** l’archive téléchargée depuis GitHub : elle contient plusieurs manifestes et catalogues, et ChatGPT la refuse avec l’erreur « Expected a single plugin archive ». Téléchargez directement **[aria-chatgpt.zip](https://github.com/Milkiway67/ARIA-plugin/releases/latest/download/aria-chatgpt.zip)** (dernière version ; versions précédentes sur la [page des versions](https://github.com/Milkiway67/ARIA-plugin/releases)). Cette archive contient que `.codex-plugin/plugin.json`, `skills/`, `assets/` et `LICENSE`, placés à la racine de l’archive. Selon l’aide d’OpenAI, l’import de plugins peut dépendre des droits accordés par l’administrateur de votre espace de travail.

#### Construire les archives d’import

Sur macOS ou Linux, depuis le dossier du dépôt :

```bash
./scripts/build-zips.sh
```

Le script produit `dist/aria-chatgpt.zip` (ChatGPT) et `dist/aria-claude.zip` (Claude). Chaque archive ne contient qu’un seul manifeste de plugin.

#### Publier une nouvelle version

1. Mettez à jour le numéro de version dans `.codex-plugin/plugin.json`, `.claude-plugin/plugin.json` et `.claude-plugin/marketplace.json`, ainsi que l’historique ci-dessous.
2. Créez la release, au choix :
   - sur GitHub, avec une *release* dont le tag reprend ce numéro précédé de `v` (par exemple `v0.48.3`) ;
   - ou en ligne de commande, en poussant ce tag (`git tag v0.48.3 && git push origin v0.48.3`). La release est alors créée automatiquement, avec les notes de `.github/release-notes/v0.48.3.md` si ce fichier existe.
3. Le workflow [`.github/workflows/release.yml`](.github/workflows/release.yml) vérifie que les numéros de version concordent, construit les deux archives et les joint à la release. Les liens de téléchargement direct pointent ensuite automatiquement vers cette nouvelle version.

### 3. Gemini : créer un GEM

1. Dans Gemini, ouvrez l'édition d'un GEM.
2. Dans **Instructions**, collez le contenu de [`skills/aria/SKILL.md`](skills/aria/SKILL.md), **sans** l’en-tête situé entre les lignes `---`.
3. Dans **Connaissances**, ajoutez les fichiers du dossier `skills/aria/references/`. Ce sont des PDF et des `.pptx`. Ne joignez pas le `README.md` du dossier.
4. Facultatif : reprenez le nom, l’icône (`assets/gpt-icon.png`) et les amorces de conversation proposées dans [Exemples pour démarrer](#exemples-pour-démarrer).

Il y a exactement 20 documents, ce qui peut constituer une limite pour Gemini.

### 4. Claude / ChatGPT : créer un Projet

1. Créez un **Projet**.
2. Collez le contenu de `SKILL.md` (sans l’en-tête `---`) dans les **instructions du projet**.
3. Ajoutez les documents de référence dans les **connaissances du projet**. Si la taille totale pose problème, commencez par ceux qui portent directement sur ARIA :
   - *Évaluer en enseignement supérieur à l’ère de l’IA — Le modèle ARIA* ;
   - *Taxonomie de Bloom IA* ;
   - les deux grilles d’analyse.

### 5. Autres assistants configurables (Copilot, Gemini, Le Chat…)

Le principe est le même partout : les instructions de `SKILL.md` deviennent les instructions de l’assistant, et les documents deviennent sa base de connaissances. Les limites de taille, de nombre et de format des fichiers varient selon l’outil et l’abonnement. Vérifiez-les avant de commencer.

---

## Exemples pour démarrer

- « Qu’est-ce que le cadre ARIA ? »
- « Pourquoi transformer mes évaluations ? »
- « Aide-moi à améliorer mes évaluations. »
- « Aide-moi à repenser une étude de cas pour évaluer le raisonnement clinique dans un contexte où les étudiant·es utilisent l’IA. »

Le dernier exemple donne d’emblée la discipline, la tâche et la compétence visée. Les premiers échanges vont ainsi plus vite.

---

## Contenu du dépôt

| Chemin | Rôle | Utilisé par |
| --- | --- | --- |
| `skills/aria/SKILL.md` | **Les instructions pédagogiques ARIA** (le cœur du plugin), avec la carte des documents par étape | Tous les outils |
| `skills/aria/references/` | Les 20 documents de référence (PDF, PPTX) | Tous les outils (ajout manuel hors Claude Code et Codex) |
| `skills/aria/lookup/knowledge-index.json` | Index des documents | Export d’origine |
| `skills/aria/agents/openai.yaml` | Présentation de la compétence | Codex |
| `.claude-plugin/plugin.json` | Manifeste du plugin | Claude Code |
| `.claude-plugin/marketplace.json` | Catalogue de distribution depuis ce dépôt | Claude Code |
| `.codex-plugin/plugin.json` | Manifeste du plugin (nom, icône, amorces) | Codex |
| `.agents/plugins/marketplace.json` | Catalogue de distribution depuis ce dépôt | Codex |
| `scripts/build-zips.sh` | Construction des archives d’import manuel (`dist/`) | ChatGPT, Claude |
| `.github/workflows/release.yml` | Ajout automatique des archives à chaque release | GitHub Actions |
| `assets/gpt-icon.png` | Icône | Claude Code, Codex, GPT personnalisé |
| `RESSOURCES.md` | Liste des documents avec liens | Lecture humaine |

---

## Historique des versions

**0.48.2**

- Import dans ChatGPT : ajout du script `scripts/build-zips.sh`, qui produit une archive à manifeste unique par outil. L’archive complète du dépôt provoquait l’erreur « Expected a single plugin archive ».
- Archives d’import en téléchargement direct sur la [page des versions](https://github.com/Milkiway67/ARIA-plugin/releases), jointes automatiquement à chaque release.
- Suppression du manifeste générique `plugin.json` à la racine, lu par aucun outil.
- Codex et ChatGPT : nom affiché (« ARIA – Évaluation et IA ») et description courte raccourcis à 30 caractères au plus.

**0.48.1**

- Noms des 20 documents de référence simplifiés (sans accents, espaces ni caractères spéciaux). Les anciens noms provoquaient l’erreur « Zip file contains path with invalid characters » lors de l’import du ZIP dans Claude. La correspondance avec les titres d’origine figure dans [RESSOURCES.md](RESSOURCES.md).

**0.48.0**

- Compétence et plugin renommés `aria` (anciennement `instructions` et `gpt-f51e0a72d0d7feb12fcfbf488fd78474`).
- Les instructions renvoient désormais aux documents de référence, classés par étape, et demandent de citer les sources consultées.
- Ajout des manifestes Claude Code (`.claude-plugin/`).
- Codex : l’authentification du catalogue passe de `ON_INSTALL` à `ON_USE`, puisque le plugin ne se connecte à aucun service.
- Correction d’une coquille dans les instructions (« évaluation »).

**0.47.1+bundle.9c63f7fbd7ffb6c98f4d755741821118** — Version d’origine, exportée depuis un GPT personnalisé.

---

## Contributions

Pour signaler un problème ou proposer une amélioration, ouvrez une [issue](https://github.com/Milkiway67/ARIA-plugin/issues) ou une *pull request*. Précisez :

- l’outil utilisé ;
- le contexte pédagogique ;
- le changement proposé.

---

## Licence et crédits

- **Instructions et fichiers du plugin** : [GNU GPL v3](LICENSE).
- **Documents de référence** : ils **ne sont pas couverts par la GPL**. Chacun conserve les droits, les attributions et la licence indiqués par ses auteurs. Respectez-les si vous les réutilisez ou les redistribuez. Leur inventaire figure dans [RESSOURCES.md](RESSOURCES.md).
