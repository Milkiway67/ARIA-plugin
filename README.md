# ARIA — Transformer l’évaluation à l’ère de l’IA

ARIA est un ensemble d’**instructions pédagogiques** (un « prompt système ») et de **20 documents de référence**. Il sert à configurer un assistant conversationnel qui aide les enseignant·es de l’enseignement supérieur à repenser leurs évaluations dans un contexte où les étudiant·es utilisent l’IA.

**Autrice : Sandrine DECAMPS.** Langue : français.

> **En bref.** Ce n’est pas un logiciel. Il n’y a ni code, ni serveur, ni clé API. Le plugin est empaqueté pour **Codex (OpenAI)**. Pour les autres outils (ChatGPT, Claude, Copilot, Gemini, Le Chat…), vous recréez l’assistant à la main : vous copiez les instructions et vous ajoutez les documents. Voir [Installation selon votre outil](#installation-selon-votre-outil).

---

## Ce que fait l’assistant

Il guide l’enseignant·e en **quatre étapes** (modèle ARIA) :

| Étape | Objectif |
| --- | --- |
| 1. **Analyser** | Repérer les fragilités de l’évaluation actuelle : validité, alignement, tâches faciles à automatiser. |
| 2. **Repenser** | Concevoir des tâches authentiques et inclusives, et reformuler les objectifs (taxonomie de Bloom adaptée à l’IA). |
| 3. **Intégrer** | Encadrer l’usage des outils numériques et de l’IA de façon transparente et traçable. |
| 4. **Accompagner** | Développer chez les étudiant·es les compétences humaines et la littératie IA. |

Comportements prévus par les instructions :

- il pose **une seule question à la fois** et adapte ses propositions à la discipline, au niveau et aux compétences visées ;
- il **ne recommande jamais de détecteur d’IA** ;
- il emploie le terme « enseignement supérieur » plutôt qu’« universitaire ».

### Limites à connaître

- **L’assistant ne se réfère pas toujours aux documents.** Les instructions ([`SKILL.md`](skills/instructions/SKILL.md)) ne citent pas les documents de référence. Selon l’outil, il les consulte peu ou pas du tout. Pour qu’il s’appuie sur eux, demandez-le explicitement, par exemple : « Appuie-toi sur le guide pédagogique ARIA ».
- **Les documents sont volumineux** : environ 54 Mo au total, dont trois fichiers de plus de 8 Mo. Certains outils limitent la taille ou le nombre des fichiers qu’on peut joindre.
- **Les présentations (`.pptx`) ne sont pas lisibles partout.** Si votre outil refuse ce format, exportez-les en PDF.
- **La qualité des réponses dépend du modèle d’IA** utilisé. Comme pour tout assistant génératif, vérifiez les références et les propositions avant de les utiliser.

---

## Installation selon votre outil

| Outil | Méthode | Effort |
| --- | --- | --- |
| Codex (OpenAI) | Installation du plugin depuis le catalogue du dépôt | Faible |
| ChatGPT (GPT personnalisé) | Recréer un GPT : instructions + 20 fichiers | Moyen |
| Claude Code | Copier le dossier de la compétence (*skill*) | Faible |
| Claude.ai (Projet) | Instructions du projet + documents | Moyen |
| Autres assistants configurables | Copier les instructions et joindre les documents | Moyen |

Pour toutes les méthodes, commencez par récupérer le dépôt. Sur [la page du dépôt](https://github.com/Milkiway67/ARIA-plugin), cliquez sur **Code → Download ZIP** puis décompressez l’archive. Vous pouvez aussi le cloner :

```bash
git clone https://github.com/Milkiway67/ARIA-plugin.git
```

### 1. Codex (OpenAI) : installation du plugin

Cet outil utilise directement les fichiers du plugin.

1. Ajoutez le dépôt comme source de plugins :

   ```bash
   codex plugin marketplace add Milkiway67/ARIA-plugin
   ```

2. Si vous utilisez l’application de bureau, redémarrez-la si nécessaire.
3. Ouvrez le répertoire des plugins et choisissez la source **ARIA**.
4. Installez **Transformer l’évaluation à l’ère de l’IA**, puis ouvrez un nouveau chat.

Remarques :

- La commande et les menus peuvent changer selon votre version de Codex. Consultez la [documentation officielle sur les plugins](https://developers.openai.com/plugins/build/plugins).
- Ce catalogue est propre au dépôt. Le plugin n’est **pas** publié dans le répertoire public d’OpenAI.
- Les réglages de votre organisation peuvent bloquer l’installation de plugins provenant de catalogues tiers.

### 2. ChatGPT : recréer un GPT personnalisé

1. Dans ChatGPT, ouvrez **Explorer les GPT → Créer**, puis l’onglet **Configurer**.
2. Dans **Instructions**, collez le contenu de [`skills/instructions/SKILL.md`](skills/instructions/SKILL.md), **sans** l’en-tête situé entre les lignes `---`.
3. Dans **Connaissances**, ajoutez les fichiers du dossier `skills/instructions/references/`. Ce sont des PDF et des `.pptx`. Ne joignez pas le `README.md` du dossier.
4. Facultatif : reprenez le nom, l’icône (`assets/gpt-icon.png`) et les amorces de conversation proposées dans [Exemples pour démarrer](#exemples-pour-démarrer).

Il y a exactement 20 documents, ce qui correspond à la limite de fichiers d’un GPT. Si vous voulez en ajouter un, il faudra en retirer un autre ou en fusionner.

### 3. Claude Code : installation de la compétence

Le fichier `SKILL.md` respecte le format des compétences (*skills*) d’agent. Copiez le dossier sous un nom explicite, car le nom d’origine `instructions` est trop générique :

```bash
mkdir -p ~/.claude/skills && cp -R ARIA-plugin/skills/instructions ~/.claude/skills/aria
```

Ensuite, dans `~/.claude/skills/aria/SKILL.md`, remplacez la ligne `name: instructions` par `name: aria`. Le dépôt ne contient pas de manifeste `.claude-plugin/`. Il ne peut donc pas être ajouté comme marketplace de plugins Claude Code.

### 4. Claude.ai : créer un Projet

1. Créez un **Projet**.
2. Collez le contenu de `SKILL.md` dans les **instructions du projet**.
3. Ajoutez les documents de référence dans les **connaissances du projet**. Si la taille totale pose problème, commencez par ceux qui portent directement sur ARIA :
   - *Guide pédagogique Cadre ARIA* ;
   - *Évaluer en enseignement supérieur à l’ère de l’IA — Le modèle ARIA* ;
   - *Taxonomie de Bloom IA* ;
   - les grilles d’analyse.

### 5. Autres assistants configurables (Copilot, Gemini, Le Chat…)

Le principe est le même partout : les instructions de `SKILL.md` deviennent les instructions de l’assistant, et les documents deviennent sa base de connaissances. Les limites de taille, de nombre et de format des fichiers varient selon l’outil et l’abonnement. Vérifiez-les avant de commencer.

---

## Exemples pour démarrer

- « Qu’est-ce que le cadre ARIA ? »
- « Pourquoi transformer mes évaluations ? »
- « Aide-moi à améliorer mes évaluations. »
- « J’enseigne en soins infirmiers. Aide-moi à repenser une étude de cas pour évaluer le raisonnement clinique dans un contexte où les étudiant·es utilisent l’IA. »

Le dernier exemple donne d’emblée la discipline, la tâche et la compétence visée. Les premiers échanges vont ainsi plus vite.

---

## Contenu du dépôt

| Chemin | Rôle | Utilisé par |
| --- | --- | --- |
| `skills/instructions/SKILL.md` | **Les instructions pédagogiques ARIA** (le cœur du plugin) | Tous les outils |
| `skills/instructions/references/` | Les 20 documents de référence (PDF, PPTX) | Tous les outils (ajout manuel hors Codex) |
| `skills/instructions/lookup/knowledge-index.json` | Index des documents | Export d’origine |
| `skills/instructions/agents/openai.yaml` | Présentation de la compétence | Codex |
| `.codex-plugin/plugin.json` | Manifeste du plugin (nom, icône, amorces) | Codex |
| `.agents/plugins/marketplace.json` | Catalogue de distribution depuis ce dépôt | Codex |
| `plugin.json` | Manifeste générique ajouté pour la diffusion | Non lu par Codex ni Claude Code |
| `assets/gpt-icon.png` | Icône | Codex, GPT personnalisé |
| `RESSOURCES.md` | Liste des documents avec liens | Lecture humaine |

L’identifiant technique du plugin (`gpt-f51e0a72…`) et son numéro de version viennent de l’export d’origine. Ils indiquent que le plugin provient d’un GPT personnalisé.

---

## Version et contributions

Les instructions, l’icône et les 20 documents sont repris **sans modification** de la version d’origine `0.47.1+bundle.9c63f7fbd7ffb6c98f4d755741821118`. Les fichiers ajoutés pour la diffusion sur GitHub sont le manifeste générique, le catalogue et cette documentation. L’index et les liens ont été adaptés aux noms des fichiers publiés.

Pour signaler un problème ou proposer une amélioration, ouvrez une [issue](https://github.com/Milkiway67/ARIA-plugin/issues) ou une *pull request*. Précisez :

- l’outil utilisé ;
- le contexte pédagogique ;
- le changement proposé.

---

## Licence et crédits

- **Instructions et fichiers du plugin** : [GNU GPL v3](LICENSE).
- **Documents de référence** : ils **ne sont pas couverts par la GPL**. Chacun conserve les droits, les attributions et la licence indiqués par ses auteurs. Respectez-les si vous les réutilisez ou les redistribuez. Leur inventaire figure dans [RESSOURCES.md](RESSOURCES.md).
