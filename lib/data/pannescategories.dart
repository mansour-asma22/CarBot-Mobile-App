/// pannescategories.dart

/// Représente une catégorie de panne.
class PanneCategory {
  final String name;           // Nom affichable de la catégorie (ex: "Électrique")
  final List<String> keywords; // Mots-clés (et synonymes) pour détecter la catégorie
  final List<String> questions;
  final String conclusion;

  PanneCategory({
    required this.name,
    required this.keywords,
    required this.questions,
    required this.conclusion,
  });
}

/// Base de données des différentes catégories de pannes.
final Map<String, PanneCategory> pannesCategories = {
  "electrique": PanneCategory(
    name: "Électrique",
    keywords: ["batterie", "fusible", "alternateur", "demarre", "ampoule", "électricité", "démarrage"],
    questions: [
      "Les feux de la voiture s’allument-ils correctement ?",
      "La batterie semble-t-elle faible ou déchargée ?",
      "Le démarreur fait-il un cliquetis ?",
    ],
    conclusion:
    "Je pense qu'il s'agit d'un problème électrique.\nMerci de contacter un électricien automobile.",
  ),
  "mecanique": PanneCategory(
    name: "Mécanique",
    keywords: ["moteur", "bruit", "fuite", "huile", "échappement", "poulie", "transmission"],
    questions: [
      "Entendez-vous un bruit inhabituel ou régulier ?",
      "Avez-vous remarqué des fuites de liquide ou d’huile ?",
      "Le moteur chauffe-t-il plus que d’habitude ?",
    ],
    conclusion:
    "Je pense qu'il s'agit d'un problème mécanique.\nMerci de contacter un mécanicien.",
  ),
  "climatisation": PanneCategory(
    name: "Climatisation",
    keywords: ["clim", "air", "froid", "chauffe", "climatisation", "AC", "climatiseur"],
    questions: [
      "La climatisation souffle-t-elle de l'air froid ?",
      "Entendez-vous un bruit quand vous allumez la clim ?",
      "Avez-vous vérifié le niveau de gaz réfrigérant ?",
    ],
    conclusion:
    "Il semble que ce soit un souci de climatisation.\nVeuillez contacter un spécialiste en clim automobile.",
  ),
  "pneu": PanneCategory(
    name: "Pneumatique",
    keywords: ["pneu", "gonflage", "usure", "crevaison", "pression", "roue"],
    questions: [
      "Le pneu est-il visiblement crevé ou endommagé ?",
      "Avez-vous vérifié la pression des pneus récemment ?",
    ],
    conclusion:
    "Ça semble être un problème de pneus.\nDirigez-vous vers un technicien en pneumatique ou un garage spécialisé.",
  ),
  "freinage": PanneCategory(
    name: "Freinage",
    keywords: ["frein", "plaquette", "disque", "pédale", "ABS", "crissement"],
    questions: [
      "La pédale de frein est-elle spongieuse ou trop dure ?",
      "Entendez-vous un crissement quand vous freinez ?",
      "Avez-vous remarqué une distance de freinage plus longue ?",
    ],
    conclusion:
    "Problème de freinage détecté.\nMerci de contacter un spécialiste freinage ou un garagiste.",
  ),
  "carrosserie": PanneCategory(
    name: "Carrosserie",
    keywords: ["carrosserie", "rayure", "choc", "tôle", "rouille", "bosselage"],
    questions: [
      "La partie endommagée est-elle très déformée ou rouillée ?",
      "Voyez-vous une fissure ou un trou dans la tôle ?",
    ],
    conclusion:
    "Problème de carrosserie.\nContactez un tôlier ou un carrossier.",
  ),
};
