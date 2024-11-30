import 'package:algorithmic_story/commons/enums/character_attribute.dart';
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

    final averageValue = attributes.values.reduce((a, b) => a + b) / attributes.length; // Ortalama değeri bul

    final analysis = StringBuffer();

    // Başlık
    analysis.writeln("### Karakter Analiziniz ###\n");

    // Güçlü ve Zayıf Yönler
    analysis.writeln("En güçlü özelliğiniz: ${describeAttribute(highestAttribute.key)} (${highestAttribute.value})");
    analysis.writeln(
        "Geliştirilmesi gereken özelliğiniz: ${describeAttribute(lowestAttribute.key)} (${lowestAttribute.value})\n");

    // Genel Performans
    if (averageValue > 5) {
      analysis.writeln("Genel olarak oldukça dengeli ve güçlü bir karakter yapınız var.");
    } else if (averageValue > 3) {
      analysis.writeln("Karakteriniz ortalama seviyede dengeli. Bazı yönlerinizi geliştirmeniz faydalı olacaktır.");
    } else {
      analysis.writeln(
          "Karakterinizde bazı eksikler var. Güçlü yönlerinizi artırmak için daha fazla çaba sarf etmelisiniz.");
    }

    analysis.writeln("\n### Özelliklere Göre Yorumlar ###");

    // Özelliklere Göre Yorumlar
    attributes.forEach((attribute, value) {
      if (value > 5) {
        analysis.writeln(
            "- ${describeAttribute(attribute)}: Bu alanda oldukça başarılısınız ve doğal bir yeteneğiniz var.");
      } else if (value > 3) {
        analysis.writeln(
            "- ${describeAttribute(attribute)}: Ortalama seviyedesiniz. Bu özelliği geliştirmek sizi daha güçlü yapabilir.");
      } else {
        analysis.writeln(
            "- ${describeAttribute(attribute)}: Bu alanda eksikleriniz bulunuyor. Daha fazla çaba göstermelisiniz.");
      }
    });

    // Attribute'ler Arasındaki İlişkiler
    analysis.writeln("\n### Özellikler Arası İlişkiler ###");
    if (attributes[CharacterAttribute.courage]! > attributes[CharacterAttribute.diplomacy]!) {
      analysis.writeln(
          "- Cesaretiniz, diplomasinizden daha yüksek. Sorunlara doğrudan müdahale etmeyi tercih ediyorsunuz, ancak daha barışçıl çözümler düşünmeyi öğrenebilirsiniz.");
    } else {
      analysis.writeln(
          "- Diplomasiniz, cesaretinizden daha yüksek. Barışçıl çözümler üretmede başarılısınız, ancak cesur kararlar almayı ihmal etmeyin.");
    }

    if (attributes[CharacterAttribute.strategicThinking]! > attributes[CharacterAttribute.economicForesight]!) {
      analysis.writeln(
          "- Stratejik düşünme yeteneğiniz ekonomik planlamadan daha baskın. Uzun vadeli hedeflerde başarılısınız, ancak kaynak yönetimine daha fazla odaklanmalısınız.");
    } else {
      analysis.writeln(
          "- Ekonomik planlama yeteneğiniz stratejik düşünmeden daha güçlü. Kısa vadeli kararlarınız etkili, ancak uzun vadeli planlara odaklanmayı unutmayın.");
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
