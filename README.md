# ARIA — Transformer l’évaluation à l’ère de l’IA

Un assistant conversationnel conçu pour accompagner les enseignant·es de l’enseignement supérieur dans la transformation de leurs évaluations avec l’intelligence artificielle.

**Autrice du plugin : Sandrine DECAMPS.**

## L’accompagnement proposé

Le plugin suit les quatre étapes du modèle ARIA :

1. **Analyser** les objectifs, l’alignement et les fragilités de l’évaluation actuelle.
2. **Repenser** les tâches pour proposer des évaluations authentiques et inclusives.
3. **Intégrer** les outils numériques et l’IA avec transparence et discernement.
4. **Accompagner** les étudiant·es dans le développement de leurs compétences humaines et de leur littératie IA.

L’assistant pose une question à la fois pour construire des propositions adaptées au contexte de l’enseignant·e. Il ne recommande pas les détecteurs d’IA.

## Télécharger et consulter

Utilisez **Code → Download ZIP** sur [la page du dépôt](https://github.com/Milkiway67/ARIA-plugin), ou clonez-le :

```sh
git clone https://github.com/Milkiway67/ARIA-plugin.git
```

Les [instructions pédagogiques](skills/instructions/SKILL.md) et les [20 documents de référence](RESSOURCES.md) sont consultables directement dans le dépôt. Les instructions peuvent aussi servir de base pour configurer un assistant dans un autre outil ; les documents doivent alors lui être fournis séparément selon les possibilités de cet outil.

## Installer depuis le catalogue du dépôt

Avec une version de Codex prenant en charge les catalogues de plugins, ajoutez ce dépôt :

```sh
codex plugin marketplace add Milkiway67/ARIA-plugin
```

Redémarrez l’application de bureau si nécessaire, ouvrez le répertoire des plugins et choisissez la source **ARIA**. Installez **Transformer l’évaluation à l’ère de l’IA**, puis commencez un nouveau chat.

Le catalogue est déclaré dans [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json). Cette distribution par dépôt est distincte d’une publication dans le répertoire public universel d’OpenAI. Les possibilités d’installation dépendent du client utilisé et des réglages de votre organisation.

Voir la [documentation officielle sur les plugins et leurs catalogues](https://developers.openai.com/plugins/build/plugins).

## Exemples pour démarrer

- « Qu’est-ce que le cadre ARIA ? »
- « Pourquoi transformer mes évaluations ? »
- « Aide-moi à améliorer mes évaluations. »
- « J’enseigne en soins infirmiers. Aide-moi à repenser une étude de cas pour évaluer le raisonnement clinique dans un contexte où les étudiant·es utilisent l’IA. »

## Contenu du dépôt

| Chemin | Contenu |
| --- | --- |
| `plugin.json` | Manifeste portable du plugin |
| `.codex-plugin/plugin.json` | Manifeste de compatibilité et présentation d’origine |
| `.agents/plugins/marketplace.json` | Catalogue permettant de distribuer le plugin depuis ce dépôt |
| `skills/instructions/SKILL.md` | Instructions pédagogiques ARIA |
| `skills/instructions/agents/openai.yaml` | Présentation de la compétence |
| `skills/instructions/lookup/knowledge-index.json` | Index des documents |
| `skills/instructions/references/` | 20 PDF et présentations pédagogiques |
| `assets/gpt-icon.png` | Icône du plugin |

Ce plugin contient des instructions et des ressources ; il ne comporte pas de serveur, d’intégration externe ou de clé API à configurer.

## Version et contributions

Les 25 fichiers du plugin d’origine sont conservés sans modification, à partir de la version `0.47.1+bundle.9c63f7fbd7ffb6c98f4d755741821118`. Le manifeste portable, le catalogue et cette documentation ont été ajoutés pour sa diffusion sur GitHub.

Pour proposer une correction ou une amélioration, ouvrez une [issue](https://github.com/Milkiway67/ARIA-plugin/issues) ou une pull request. Précisez le contexte pédagogique et le changement proposé. Conservez les crédits et les mentions de licence des ressources.

## Licence et crédits

Le plugin est distribué sous la licence **GNU GPL v3** déjà présente dans ce dépôt : voir [LICENSE](LICENSE).

Les documents pédagogiques conservent les attributions et les mentions de licence figurant dans chaque fichier. Leur inventaire est disponible dans [RESSOURCES.md](RESSOURCES.md).
