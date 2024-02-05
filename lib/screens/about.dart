import 'package:flutter/material.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/typografy/title.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String about1 =
      'Bem-vindo ao Mind Ease, o seu refúgio para paz mental e bem-estar emocional. Nossa essência reside em oferecer um suporte acolhedor e efetivo para aqueles que enfrentam ansiedade, depressão e estresse em suas vidas. Combinando a poderosa tecnologia com a compaixão humana, buscamos fornecer uma experiência única e transformadora através de áudios e vídeos especialmente projetados para aliviar a carga emocional e promover a calma interior.';
  String about2 =
      'No Mind Ease, acreditamos que a saúde mental é uma prioridade que merece atenção cuidadosa. Compreendemos o quão desafiadoras podem ser as batalhas internas que muitos de nós enfrentamos diariamente, e é por isso que nossa equipe de especialistas em saúde mental, terapeutas e desenvolvedores se uniu para criar esta plataforma de apoio e bem-estar. Nossa missão é proporcionar um ambiente seguro e inclusivo, onde todos possam encontrar alívio e fortalecer sua resiliência emocional.';
  String mission =
      'Nossa missão é clara: queremos ser a luz orientadora na escuridão que a ansiedade, depressão e estresse podem trazer. Buscamos capacitar nossos usuários a conquistar a tranquilidade interior, restaurar o equilíbrio emocional e encontrar a esperança em meio aos desafios da vida. Nosso compromisso é fornecer recursos terapêuticos de alta qualidade, cuidadosamente criados para promover uma jornada de autocuidado positiva e significativa.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        foregroundColor: Colors.white,
        title: const Text('Nossa essência'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: double.infinity,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 86),
              const SizedBox(height: 8),
              const Text(
                'MindEase',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          ),
          Text(about1, style: TextStyle()),
          const SizedBox(
            height: 16,
          ),
          const TextTitle(value: 'Sobre o MindEase'),
          const SizedBox(
            height: 4,
          ),
          Text(about2, style: TextStyle()),
          const SizedBox(
            height: 16,
          ),
          const TextTitle(value: 'Nossa missão'),
          const SizedBox(
            height: 4,
          ),
          Text(mission, style: TextStyle()),
        ]),
      )),
    );
  }
}
