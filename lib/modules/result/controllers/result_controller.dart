import 'package:algorithmic_story/enums/character_attribute.dart';
import 'package:flutter/material.dart';

class ResultController extends ChangeNotifier {
  ResultController(Map<CharacterAttribute, int> result) {
    attributes = result;
  }
  Map<CharacterAttribute, int> attributes = {
    CharacterAttribute.diplomacy: 0,
    CharacterAttribute.courage: 0,
    CharacterAttribute.leadership: 0,
    CharacterAttribute.empathy: 0,
    CharacterAttribute.strategicThinking: 0,
    CharacterAttribute.economicForesight: 0,
    CharacterAttribute.independence: 0,
  };

  String generateCharacterAnalysis() {
    final highestAttribute = attributes.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    ); // En yüksek attribute'u bul
    final lowestAttribute = attributes.entries.reduce(
      (a, b) => a.value < b.value ? a : b,
    ); // En düşük attribute'u bul

    final analysis = StringBuffer();

    analysis.writeln("### Liderlik Analiziniz ###");
    analysis
        .writeln("\n\nEn güçlü özelliğiniz: ${describeAttribute(highestAttribute.key)} (${highestAttribute.value})");
    analysis.writeln(
        "\nGeliştirilmesi gereken özelliğiniz: ${describeAttribute(lowestAttribute.key)} (${lowestAttribute.value})");

    // Özelliklere özel analizler
    if (attributes[CharacterAttribute.courage]! > attributes[CharacterAttribute.diplomacy]!) {
      analysis.writeln(
          "\nCesur bir lidersiniz! Risk almayı seviyorsunuz ve sorunlara doğrudan müdahale etmekten çekinmiyorsunuz. Ancak diplomasiye daha fazla önem vermelisiniz.");
    } else {
      analysis.writeln(
          "\nDiplomatik bir lidersiniz! Sorunlara barışçıl çözümler bulmayı tercih ediyorsunuz. Ancak cesaret gerektiren durumlarda daha güçlü olmanız gerekebilir.");
    }

    if (attributes[CharacterAttribute.leadership]! > 5) {
      analysis.writeln("Liderlik konusunda oldukça başarılısınız! Halkınız ve ordunuz sizin arkanızda duruyor.");
    } else {
      analysis.writeln(
          "\nLiderlik konusunda daha fazla çaba sarf etmelisiniz. Halkınızın ve ordunuzun desteğini kazanmak için daha fazla girişimde bulunabilirsiniz.");
    }

    if (attributes[CharacterAttribute.economicForesight]! > attributes[CharacterAttribute.strategicThinking]!) {
      analysis.writeln(
          "\nEkonomik planlama konusunda oldukça iyisiniz! Krallığınızın mali durumunu etkin bir şekilde yönetiyorsunuz.");
    } else {
      analysis.writeln(
          "\nStratejik düşünme yeteneğiniz güçlü! Uzun vadeli planlar yaparak krallığınızın geleceğini şekillendiriyorsunuz.");
    }

    if (attributes[CharacterAttribute.independence]! > 5) {
      analysis.writeln(
          "\nBağımsız bir yönetim tarzınız var! Dış güçlerden etkilenmeden krallığınızı yönetmeyi tercih ediyorsunuz.");
    } else {
      analysis.writeln(
          "\nİşbirlikçi bir lidersiniz! Müttefiklerinizle güçlü ilişkiler kurarak krallığınızın gücünü artırıyorsunuz.");
    }

    return analysis.toString();
  }

  String describeAttribute(CharacterAttribute attribute) {
    const descriptions = {
      CharacterAttribute.diplomacy: "Diplomasi",
      CharacterAttribute.courage: "Cesaret",
      CharacterAttribute.leadership: "Liderlik",
      CharacterAttribute.empathy: "Empati",
      CharacterAttribute.strategicThinking: "Stratejik Düşünme",
      CharacterAttribute.economicForesight: "Ekonomik Öngörü",
      CharacterAttribute.independence: "Bağımsızlık",
    };

    return descriptions[attribute]!;
  }
}
