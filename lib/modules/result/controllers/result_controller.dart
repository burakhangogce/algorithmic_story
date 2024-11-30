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
    // En güçlü ve en zayıf attribute'leri bul
    final highestAttribute = attributes.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    );
    final lowestAttribute = attributes.entries.reduce(
      (a, b) => a.value < b.value ? a : b,
    );

    // Ortalama ve toplam değerleri hesapla
    final totalScore = attributes.values.reduce((a, b) => a + b);
    final averageScore = totalScore / attributes.length;

    // Analiz başlangıcı
    final analysis = StringBuffer();
    analysis.writeln("### Kişisel Karakter Analiziniz ###\n");

    // Genel değerlendirme
    if (averageScore > 6) {
      analysis.writeln(
          "Karakteriniz olağanüstü dengeli ve güçlü bir yapıya sahip. Kararlarınızın etkilerini öngörebiliyor ve uygulamada başarı sağlayabiliyorsunuz.");
    } else if (averageScore > 4) {
      analysis.writeln(
          "Karakteriniz dengeli, ancak belirli alanlarda eksikleriniz bulunuyor. Bu eksikleri kapatarak daha büyük başarılar elde edebilirsiniz.");
    } else {
      analysis.writeln(
          "Karakterinizde belirgin zayıflıklar var. Fakat bu, geliştirme potansiyelinizin oldukça yüksek olduğu anlamına geliyor. Daha cesur adımlar atmayı düşünmelisiniz.");
    }

    // En güçlü attribute analizi
    analysis.writeln("\nGüçlü Yönünüz: ${describeAttribute(highestAttribute.key)} (${highestAttribute.value})");
    analysis.writeln(_generateStrengthDescription(highestAttribute.key));

    // En zayıf attribute analizi
    analysis.writeln("\nZayıf Yönünüz: ${describeAttribute(lowestAttribute.key)} (${lowestAttribute.value})");
    analysis.writeln(_generateWeaknessDescription(lowestAttribute.key));

    // Attribute karşılaştırmaları ve detaylı analizler
    analysis.writeln("\n### Davranış Analiziniz ###");
    if (attributes[CharacterAttribute.courage]! > attributes[CharacterAttribute.diplomacy]!) {
      analysis.writeln(
          "- Cesaretiniz ön planda. Doğrudan hareket etmek ve risk almayı seviyorsunuz. Bu sizi hızlı bir karar verici yapar, ancak diplomaside zayıflık gösterebilirsiniz.");
    } else {
      analysis.writeln(
          "- Diplomasi yeteneğiniz baskın. Çatışmalardan kaçınarak uyum yaratmayı tercih ediyorsunuz. Ancak bu bazen cesur kararlar almanızı engelleyebilir.");
    }

    if (attributes[CharacterAttribute.strategicThinking]! > attributes[CharacterAttribute.economicForesight]!) {
      analysis.writeln(
          "- Stratejik düşünme beceriniz ön planda. Uzun vadeli hedeflerde başarılısınız, ancak ekonomik öngörü gerektiren konularda zorluk yaşayabilirsiniz.");
    } else {
      analysis.writeln(
          "- Ekonomik öngörünüz baskın. Kaynaklarınızı etkili kullanabiliyorsunuz, ancak uzun vadeli planlarda daha dikkatli olmanız gerekebilir.");
    }

    // Öneriler ve sonuç
    analysis.writeln("\n### Gelişim Önerileriniz ###");
    if (averageScore > 6) {
      analysis.writeln(
          "- Mevcut güçlü yönlerinizi koruyun ve bunları daha fazla pekiştirin. Fırsatları değerlendirmek için yeni alanlara odaklanabilirsiniz.");
    } else if (averageScore > 4) {
      analysis.writeln(
          "- Dengeli bir karaktere sahipsiniz. Ancak, belirgin eksikliklerinizi ele alarak genel yapınızı daha sağlam hale getirebilirsiniz.");
    } else {
      analysis.writeln(
          "- Eksik yönlerinizi fark ederek, özellikle zayıf alanlarınıza odaklanın. Küçük ama etkili adımlar atarak büyük değişimlere yol açabilirsiniz.");
    }

    return analysis.toString();
  }

// Güçlü yönler için açıklamalar
  String _generateStrengthDescription(CharacterAttribute attribute) {
    switch (attribute) {
      case CharacterAttribute.diplomacy:
        return "İnsanlarla iletişim kurma beceriniz olağanüstü. Zor durumlarda bile barışçıl çözümler üretme yeteneğiniz sizi farklı kılar.";
      case CharacterAttribute.courage:
        return "Cesaretiniz ve kararlılığınız takdire şayan. Zorluklar karşısında geri adım atmayarak fark yaratıyorsunuz.";
      case CharacterAttribute.leadership:
        return "Doğal bir lider olarak ekibinizin güvenini kazanıyorsunuz. İnsanları bir araya getirerek hedeflere ulaşıyorsunuz.";
      case CharacterAttribute.empathy:
        return "Empati yeteneğiniz sayesinde başkalarının duygularını ve ihtiyaçlarını anlamakta ustasınız.";
      case CharacterAttribute.strategicThinking:
        return "Stratejik düşünme becerinizle büyük resme odaklanabiliyorsunuz. Geleceği planlamak konusunda oldukça iyisiniz.";
      case CharacterAttribute.economicForesight:
        return "Kaynak yönetimi konusundaki becerileriniz sayesinde kısıtlı imkanlarla bile büyük başarılar elde ediyorsunuz.";
      case CharacterAttribute.independence:
        return "Bağımsızlık tutkunuz, sizi dış etkilerden bağımsız bir şekilde hareket eden bir lider yapıyor.";
    }
  }

// Zayıf yönler için açıklamalar
  String _generateWeaknessDescription(CharacterAttribute attribute) {
    switch (attribute) {
      case CharacterAttribute.diplomacy:
        return "Diplomasi konusunda zorlanıyor olabilirsiniz. Daha açık iletişim ve anlaşmaya odaklanmak faydalı olabilir.";
      case CharacterAttribute.courage:
        return "Cesaretiniz düşük olabilir. Daha fazla inisiyatif alarak kararlarınızda kendinize güvenmeyi öğrenebilirsiniz.";
      case CharacterAttribute.leadership:
        return "Liderlik yetenekleriniz gelişime açık. Başkalarının güvenini kazanmak için net ve kararlı bir tutum sergileyin.";
      case CharacterAttribute.empathy:
        return "Empati kurmakta zorlanıyor olabilirsiniz. İnsanları anlamak için daha fazla çaba sarf edin.";
      case CharacterAttribute.strategicThinking:
        return "Stratejik düşünme konusunda eksik kalabilirsiniz. Uzun vadeli hedefler belirleyip adım adım ilerlemeyi deneyin.";
      case CharacterAttribute.economicForesight:
        return "Ekonomik öngörüler konusunda zayıf olabilirsiniz. Kaynaklarınızı daha etkili planlamayı öğrenin.";
      case CharacterAttribute.independence:
        return "Bağımsızlık konusunda eksikleriniz olabilir. Kendi kararlarınızı almayı ve bunların arkasında durmayı deneyin.";
    }
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
