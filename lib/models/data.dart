import 'package:mind_ease/models/category.dart';
import 'package:mind_ease/models/collection.dart';
import 'package:mind_ease/models/subcategory.dart';

List<Category> categories = [
  Category(id: 1, name: "Destaques", subcategories: [
    Subcategory(
        id: 0,
        name: 'Diminuir o Stress',
        image: "assets/illustrations/destaque-01.png",
        collections: [
          Collection(id: 1, name: "Exercícios de respiração para relaxamento."),
          Collection(id: 2, name: "Yoga para redução do estresse."),
          Collection(
              id: 3, name: "Meditação mindfulness para alívio do estresse."),
          Collection(
              id: 4, name: "Técnicas de relaxamento muscular progressivo."),
        ]),
    Subcategory(
        id: 1,
        name: 'Controlar a Ansiedade',
        image: "assets/illustrations/destaque-02.png",
        collections: [
          Collection(id: 1, name: "Meditação para ansiedade e preocupação."),
          Collection(
              id: 2, name: "Exercícios de respiração para acalmar a mente."),
          Collection(id: 3, name: "Práticas de aceitação e autocompaixão."),
          Collection(
              id: 4, name: "Visualizações guiadas para reduzir a ansiedade."),
        ]),
    Subcategory(
        id: 2,
        name: 'Ter uma Vida Equilibrada',
        image: "assets/illustrations/destaque-03.png",
        collections: [
          Collection(
              id: 1,
              name: "Práticas de mindfulness para equilíbrio emocional."),
          Collection(
              id: 2, name: "Exercícios de autorreflexão e autoconhecimento."),
          Collection(id: 3, name: "Dicas para estabelecer limites saudáveis."),
          Collection(id: 4, name: "Desenvolvimento de uma rotina equilibrada."),
        ]),
    Subcategory(
        id: 3,
        name: 'Dormir melhor',
        image: "assets/illustrations/destaque-04.png",
        collections: [
          Collection(id: 1, name: "Meditações para induzir o sono."),
          Collection(
              id: 2, name: "Exercícios de autorreflexão e autoconhecimento."),
          Collection(id: 3, name: "Dicas para estabelecer limites saudáveis."),
          Collection(id: 4, name: "Desenvolvimento de uma rotina equilibrada."),
        ]),
    Subcategory(
        id: 4,
        name: 'Amar e perdoar',
        image: "assets/illustrations/destaque-05.png",
        collections: [
          Collection(
              id: 1,
              name: "Meditação de compaixão para si mesmo e para os outros."),
          Collection(
              id: 2, name: "Práticas de perdão e liberação de ressentimentos."),
          Collection(id: 3, name: "Cultivo de gratidão e positividade."),
          Collection(
              id: 4,
              name:
                  "Exercícios para desenvolver empatia e amor incondicional."),
        ]),
    Subcategory(
        id: 5,
        name: 'Meditação para crianças',
        image: 'assets/illustrations/destaque-06.png',
        collections: [
          Collection(id: 1, name: "Contos mindfulness para crianças."),
          Collection(id: 2, name: "Exercícios de respiração para crianças."),
          Collection(
              id: 3, name: "Meditações guiadas para acalmar a mente infantil."),
          Collection(
              id: 4,
              name:
                  "Atividades lúdicas para promover o bem-estar em crianças."),
        ]),
  ]),
  Category(id: 2, name: "Técnicas de respiração", subcategories: [
    Subcategory(
        id: 1,
        name: "Respiração profunda guiada",
        image: "assets/illustrations/respiracao-01.png",
        collections: [
          Collection(
              id: 1, name: "Técnica 4-7-8 para relaxamento instantâneo."),
          Collection(
              id: 2, name: "Respiração diafragmática para alívio do estresse."),
          Collection(
              id: 3, name: "Respiração alternada para equilíbrio emocional."),
          Collection(
              id: 4,
              name: "Técnica de respiração completa para clareza mental."),
        ])
  ]),
  Category(id: 3, name: "Sons para dormir", subcategories: [
    Subcategory(
        id: 1,
        name: "Chuva",
        image: "assets/illustrations/sons-01.png",
        collections: [
          Collection(id: 1, name: "Chuva suave para indução ao sono."),
          Collection(
              id: 2, name: "Tempestade relaxante para um sono profundo."),
        ]),
    Subcategory(
        id: 2,
        name: "Oceano",
        image: "assets/illustrations/sons-02.png",
        collections: [
          Collection(id: 1, name: "Ondas do mar para relaxamento profundo."),
          Collection(id: 2, name: "Sons de praia para dormir e descansar."),
        ]),
    Subcategory(
        id: 3,
        name: "Animais",
        image: 'assets/illustrations/sons-03.png',
        collections: [
          Collection(
              id: 1,
              name: "Sons da floresta com cantos de pássaros para relaxar."),
          Collection(
              id: 2, name: "Ruídos suaves da natureza para dormir melhor."),
        ]),
    Subcategory(
        id: 4,
        name: "Floresta",
        image: "assets/illustrations/sons-04.png",
        collections: [
          Collection(
              id: 1,
              name: "Ruídos da floresta para meditação e tranquilidade."),
          Collection(id: 2, name: "Sons de riacho e pássaros para relaxar."),
        ]),
  ]),
  Category(id: 4, name: "Técnicas de mindfulness", subcategories: [
    Subcategory(
        id: 1,
        name: "Sessão mindfulness guiada",
        image: 'assets/illustrations/mindfulness.png',
        collections: [
          Collection(id: 1, name: "Prática de atenção plena para iniciantes."),
          Collection(
              id: 2,
              name:
                  "Meditação guiada para aumentar a consciência do momento presente."),
          Collection(
              id: 2,
              name: "Exercício de mindfulness para reduzir a ansiedade."),
          Collection(
              id: 2,
              name: "Práticas de atenção plena para melhorar a concentração."),
        ]),
  ])
];
