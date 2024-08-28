import 'package:flutter_trending_movies/app/data/providers/movie_provider.dart';
import 'package:mocktail/mocktail.dart';

class MovieProviderMock extends Mock implements MovieProvider {
  static const trendingMoviesReponseBody = '''{
  "page": 1,
  "results": [
    {
      "backdrop_path": "/58D6ZAvOKxlHjyX9S8qNKSBE9Y.jpg",
      "id": 718821,
      "title": "Twisters",
      "original_title": "Twisters",
      "overview": "Dois caçadores de tempestades arriscam suas vidas na tentativa de testar um sistema experimental de alerta meteorológico.",
      "poster_path": "/pjnD08FlMAIXsfOLKQbvmO0f0MD.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        12,
        18
      ],
      "popularity": 1175.947,
      "release_date": "2024-07-10",
      "video": false,
      "vote_average": 7.095,
      "vote_count": 575
    },
    {
      "backdrop_path": "/8xMR5w9qfpwhTJzjjvfj2ywvIF3.jpg",
      "id": 956842,
      "title": "Como Vender a Lua",
      "original_title": "Fly Me to the Moon",
      "overview": "Contratada para trabalhar a imagem da NASA com o público, a marketeira Kelly Jones precisa chegar a um acordo em como trabalhar com o diretor de lançamento, Cole Davis, que já tem muito em jogo com a missão. Quando a Casa Branca considera que a missão é importante demais para falhar, Jones precisa encenar um pouso falso na lua como back-up.",
      "poster_path": "/9Hw7uOjq7zHEixF0JBJw8E3XB4e.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        10749,
        35
      ],
      "popularity": 119.168,
      "release_date": "2024-07-10",
      "video": false,
      "vote_average": 7.047,
      "vote_count": 160
    },
    {
      "backdrop_path": "/hgWY0fXfh8UgUcjL4HEPRj1gOED.jpg",
      "id": 945961,
      "title": "Alien: Romulus",
      "original_title": "Alien: Romulus",
      "overview": "Enquanto vasculham as profundezas de uma estação espacial abandonada, um grupo de jovens colonizadores espaciais se depara com a forma de vida mais aterrorizante do universo.",
      "poster_path": "/r21zxwbJI3VlwrxN4nGDN0VUQI8.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        878,
        27,
        53
      ],
      "popularity": 597.148,
      "release_date": "2024-08-13",
      "video": false,
      "vote_average": 7.844,
      "vote_count": 16
    },
    {
      "backdrop_path": "/4cazJU7Jjb5EukxmT7XRCoO9VnV.jpg",
      "id": 1155058,
      "title": "Watchmen: Capítulo 1",
      "original_title": "Watchmen: Chapter I",
      "overview": "Em um mundo alternativo moldado por super-heróis, os outrora celebrados 'aventureiros fantasiados' foram banidos por uma sociedade desencantada com o vigilantismo. Agora, em 1985, o assassinato do Comediante, um herói que se tornou agente do governo, chama a atenção de Rorschach, o último dos vigilantes banidos. A investigação de Rorschach envolve seus colegas aposentados, Nite Owl, Silk Spectre, Dr. Manhattan e Ozymandias, em um conflito com seus passados, uns com os outros e em um mistério que ameaça suas vidas e um mundo à beira da guerra.",
      "poster_path": "/tE2vZ6HdlmKaBh0wpsvHCf7HJKo.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        16,
        18,
        878
      ],
      "popularity": 85.695,
      "release_date": "2024-08-12",
      "video": false,
      "vote_average": 8.3,
      "vote_count": 10
    },
    {
      "backdrop_path": "/7DMbi65GGXsqw857fX7uEmH6vHg.jpg",
      "id": 1059064,
      "title": "Os Provocadores",
      "original_title": "The Instigators",
      "overview": "Rory e Cobby são parceiros improváveis: um pai desesperado e um ex-presidiário reunidos para um assalto. Quando tudo dá errado, eles se unem a um cúmplice incomum—a terapeuta de Rory—para fugir da polícia, de burocratas corruptos e de um chefe do crime vingativo.",
      "poster_path": "/aOrQX4j8NuxbDAEbaSdYnKV5oHz.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        35,
        80
      ],
      "popularity": 302.35,
      "release_date": "2024-08-02",
      "video": false,
      "vote_average": 6.511,
      "vote_count": 131
    },
    {
      "backdrop_path": "/6vq5wXubxQnXqOeLxAwZrfpAwTG.jpg",
      "id": 1300962,
      "title": "A Fera Interior",
      "original_title": "The Beast Within",
      "overview": "Willow, de dez anos, segue seus pais em uma de suas caminhadas secretas noturnas até o coração de uma floresta antiga. Depois de testemunhar o pai passar por uma terrível transformação, ela também se torna presa do sombrio segredo ancestral que eles tentaram desesperadamente esconder.",
      "poster_path": "/rfvQPZBRmpwAPm0ZcJ1EKsmS1vz.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        27,
        18,
        53
      ],
      "popularity": 36.089,
      "release_date": "2024-07-22",
      "video": false,
      "vote_average": 6,
      "vote_count": 10
    },
    {
      "backdrop_path": "/8yPSYhooj8nyBbmV3GVdLDwuE7e.jpg",
      "id": 1079091,
      "title": "É Assim Que Acaba",
      "original_title": "It Ends with Us",
      "overview": "Lily Bloom, uma mulher que supera uma infância traumática para começar uma nova vida em Boston e perseguir o sonho de sua vida de abrir seu próprio negócio. Um encontro casual com o charmoso neurocirurgião Ryle Kincaid desencadeia uma conexão intensa, mas à medida que os dois se apaixonam profundamente, Lily começa a ver lados de Ryle que a lembram do relacionamento de seus pais. Quando o primeiro amor de Lily, Atlas Corrigan, reaparece repentinamente em sua vida, seu relacionamento com Ryle é abalado, e Lily percebe que deve aprender a confiar em sua própria força para fazer uma escolha impossível para o seu futuro.",
      "poster_path": "/rfGQXlI1m2jvN9a07Kojo9e2deB.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        18,
        10749
      ],
      "popularity": 1571.917,
      "release_date": "2024-08-07",
      "video": false,
      "vote_average": 7.195,
      "vote_count": 59
    },
    {
      "backdrop_path": "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
      "id": 533535,
      "title": "Deadpool & Wolverine",
      "original_title": "Deadpool & Wolverine",
      "overview": "Um apático Wade Wilson trabalha duro na vida civil. Seus dias como mercenário moralmente flexível, Deadpool, ficou para trás. Quando seu planeta enfrenta uma ameaça, Wade deve relutantemente vestir-se novamente com um ainda mais relutante... relutante? Mais relutante? Ele deve convencer um Wolverine relutante em... Porra. As sinopses são tão estúpidas.",
      "poster_path": "/xq4v7JE8niZ75OYYPDGNn6Gzpyt.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        35,
        878
      ],
      "popularity": 11393.026,
      "release_date": "2024-07-24",
      "video": false,
      "vote_average": 7.835,
      "vote_count": 1814
    },
    {
      "backdrop_path": "/lgkPzcOSnTvjeMnuFzozRO5HHw1.jpg",
      "id": 519182,
      "title": "Meu Malvado Favorito 4",
      "original_title": "Despicable Me 4",
      "overview": "Nesta sequência, o vilão mais amado do planeta retorna e agora Gru, Lucy, Margo, Edith e Agnes dão as boas-vindas a um novo membro da família: Gru Jr., que pretende atormentar seu pai. Enquanto se adapta com o pequeno, Gru enfrenta um novo inimigo, Maxime Le Mal, forçando sua namorada Valentina e a família a fugir do perigo.",
      "poster_path": "/wISieKsABnOKgNlbNLuuMmIrhem.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        16,
        10751,
        35,
        28
      ],
      "popularity": 3195.72,
      "release_date": "2024-06-20",
      "video": false,
      "vote_average": 7.354,
      "vote_count": 973
    },
    {
      "backdrop_path": "/wNAhuOZ3Zf84jCIlrcI6JhgmY5q.jpg",
      "id": 786892,
      "title": "Furiosa: Uma Saga Mad Max",
      "original_title": "Furiosa: A Mad Max Saga",
      "overview": "Quando o mundo entra em colapso, a jovem Furiosa é sequestrada do Green Place das Muitas Mães e cai nas mãos da horda de motoqueiros liderada pelo Senhor da Guerra Dementus. Vagando pelo deserto condenado, eles encontram a Cidadela controlada por Immortan Joe. Enquanto os dois tiranos lutam por poder e controle, Furiosa terá que sobreviver a muitos desafios para encontrar e trilhar o caminho de volta para casa.",
      "poster_path": "/7qOSKoOAPgemYhBwbJgBWcCxPWZ.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        12,
        878
      ],
      "popularity": 957.792,
      "release_date": "2024-05-22",
      "video": false,
      "vote_average": 7.619,
      "vote_count": 2593
    },
    {
      "backdrop_path": "/iAlsYg6dlv1fvOBypM7SldIS1Wl.jpg",
      "id": 1032823,
      "title": "Armadilha",
      "original_title": "Trap",
      "overview": "Um pai e sua filha adolescente assistem a um badalado show de música pop, quando percebem que estão no epicentro de um evento sombrio e sinistro.",
      "poster_path": "/aCBrDVxkMxLq4uPVjeJ5bZMAucy.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        80,
        53
      ],
      "popularity": 535.233,
      "release_date": "2024-07-31",
      "video": false,
      "vote_average": 6.353,
      "vote_count": 234
    },
    {
      "backdrop_path": "/lyEuje8cKjbWliYUGrOaoHVmc1R.jpg",
      "id": 1002088,
      "title": "Missão Cruzada",
      "original_title": "크로스",
      "overview": "Um ex-agente que agora é dono de casa se envolve em uma missão perigosa com a esposa, que é detetive e não sabe nada sobre o passado dele.",
      "poster_path": "/aJee3ZpITDSS1EB0HfLM5SSHWr7.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "ko",
      "genre_ids": [
        28,
        35,
        12
      ],
      "popularity": 186.234,
      "release_date": "2024-08-05",
      "video": false,
      "vote_average": 7.387,
      "vote_count": 31
    },
    {
      "backdrop_path": "/mKOBdgaEFguADkJhfFslY7TYxIh.jpg",
      "id": 365177,
      "title": "Borderlands: O Destino do Universo Está em Jogo",
      "original_title": "Borderlands",
      "overview": "Uma infame caçadora de recompensas retorna ao lugar onde cresceu, o caótico planeta Pandora, e forma uma aliança inesperada com uma equipe de desajustados para encontrar a filha desaparecida...",
      "poster_path": "/xqPSxMaJ36etkUif4VggAX9tLu0.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        878,
        12,
        35
      ],
      "popularity": 318.377,
      "release_date": "2024-08-07",
      "video": false,
      "vote_average": 5.095,
      "vote_count": 95
    },
    {
      "backdrop_path": "/oNDvZQTXNkbrcnCiOMeYu9tshpd.jpg",
      "id": 1139106,
      "title": "We Are Zombies",
      "original_title": "We Are Zombies",
      "overview": "In a city infested with the LIVING-IMPAIRED aka non-cannibal zombies - three slackers after easy money must fight small-time crooks and an evil megacorporation to save their kidnapped grandma.",
      "poster_path": "/nU5ZeQpy32xbwtxHua1ZkT5QquZ.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        27,
        35,
        53
      ],
      "popularity": 12.309,
      "release_date": "2024-07-17",
      "video": false,
      "vote_average": 5,
      "vote_count": 2
    },
    {
      "backdrop_path": "/QflfyU07MiQXSqTUCmG9Xfq0Ws.jpg",
      "id": 1281826,
      "title": "Manobra Arriscada",
      "original_title": "One Fast Move",
      "overview": "O jovem Wes, tem o sonho de pilotar motocicletas profissionalmente. Para isso, decide procurar seu pai, com quem não mantém contato há anos. Durante a busca, ele conhece uma cantora de cidade pequena que vai ajudá-lo a derrubar as barreiras emocionais que foram erguidas pela ausência do pai.",
      "poster_path": "/AkDvNXJESerCM8SlDwP8tOYcrQt.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        18,
        10749
      ],
      "popularity": 288.396,
      "release_date": "2024-08-07",
      "video": false,
      "vote_average": 6.733,
      "vote_count": 43
    },
    {
      "backdrop_path": "/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg",
      "id": 573435,
      "title": "Bad Boys: Até o Fim",
      "original_title": "Bad Boys: Ride or Die",
      "overview": "Depois que seu falecido ex-capitão é incriminado, Lowrey e Burnett tentam limpar seu nome, apenas para acabarem se tornando os mais procurados de Miami.",
      "poster_path": "/ak6VZDHms5T4p0eFISk336kqjR6.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        80,
        53,
        35
      ],
      "popularity": 3274.215,
      "release_date": "2024-06-05",
      "video": false,
      "vote_average": 7.633,
      "vote_count": 1523
    },
    {
      "backdrop_path": "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg",
      "id": 1022789,
      "title": "Divertida Mente 2",
      "original_title": "Inside Out 2",
      "overview": "'Divertida Mente 2', da Disney e da Pixar, retorna à mente da adolescente Riley, e o faz no momento em que a sala de comando está passando por uma demolição repentina para dar lugar a algo totalmente inesperado: novas emoções! Alegria, Tristeza, Raiva, Medo e Nojinho não sabem bem como reagir quando Ansiedade aparece, e tudo indica que ela não está sozinha.",
      "poster_path": "/9h2KgGXSmWigNTn3kQdEFFngj9i.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        16,
        10751,
        12,
        35
      ],
      "popularity": 3543.294,
      "release_date": "2024-06-11",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 2366
    },
    {
      "backdrop_path": "/AmR3JG1VQVxU8TfAvljUhfSFUOx.jpg",
      "id": 348,
      "title": "Alien: O Oitavo Passageiro",
      "original_title": "Alien",
      "overview": "Quando a tripulação da sonda espacial Nostromo responde a um pedido de socorro vindo de um planeta inóspito, eles descobrem uma forma de vida mortal que se reproduz dentro de humanos. Agora, a tripulação deve lutar para permanecer viva e impedir que a criatura chegue até a Terra.",
      "poster_path": "/t5xD0X1prEecMSdyLJuYdSaTM3x.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        27,
        878
      ],
      "popularity": 164.412,
      "release_date": "1979-05-25",
      "video": false,
      "vote_average": 8.156,
      "vote_count": 14225
    },
    {
      "backdrop_path": "/5oCAo7LFj2x0yByfi5JYirGnK8I.jpg",
      "id": 664,
      "title": "Twister",
      "original_title": "Twister",
      "overview": "Em Oklahoma está se anunciando uma tempestade que não acontece há décadas e dois grupos de cientistas rivais planejam entrar para a história colocando sensores no tornado, para que estas informações possam ir até um computador e, assim, seja possível prever sua chegada com maior antecedência. Mas para colocar os sensores, é necessário ficar o mais próximo possível do tornado e torcer para que os sensores sejam sugados pela tempestade. Em uma das equipes está uma jovem (Helen Hunt) obcecada por tal idéia, pois em 1969 ela viu o pai ser sugado por uma tempestade e atualmente ela planeja conseguir seu intento ou morrer tentando.",
      "poster_path": "/7QXT40RNaD0vac198G3O0U45m3y.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        28,
        12,
        18
      ],
      "popularity": 180.044,
      "release_date": "1996-05-10",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 3266
    },
    {
      "backdrop_path": "/2RVcJbWFmICRDsVxRI8F5xRmRsK.jpg",
      "id": 762441,
      "title": "Um Lugar Silencioso: Dia Um",
      "original_title": "A Quiet Place: Day One",
      "overview": "Este filme nos leva de volta ao ponto onde tudo começou, acompanhando uma nova personagem, interpretada por Lupita Nyong’o, enquanto navega pelos horríveis primeiros momentos na cidade mais barulhenta do mundo: Nova York.",
      "poster_path": "/pN9BtzUeqPIKybAu9baihz6YzyO.jpg",
      "media_type": "movie",
      "adult": false,
      "original_language": "en",
      "genre_ids": [
        27,
        878,
        53
      ],
      "popularity": 2219.58,
      "release_date": "2024-06-26",
      "video": false,
      "vote_average": 6.921,
      "vote_count": 1267
    }
  ],
  "total_pages": 1000,
  "total_results": 20000
}''';

  static const movieDetailsResponseBody = '''{
  "adult": false,
  "backdrop_path": "/AmR3JG1VQVxU8TfAvljUhfSFUOx.jpg",
  "belongs_to_collection": {
    "id": 8091,
    "name": "Alien: Coleção",
    "poster_path": "/AgyQCf3kUqWgCZifYkFYeZN1ddC.jpg",
    "backdrop_path": "/6X42JnSMdo3dPAswOHUuvebdTq7.jpg"
  },
  "budget": 11000000,
  "genres": [
    {
      "id": 27,
      "name": "Terror"
    },
    {
      "id": 878,
      "name": "Ficção científica"
    }
  ],
  "homepage": "",
  "id": 348,
  "imdb_id": "tt0078748",
  "origin_country": [
    "US"
  ],
  "original_language": "en",
  "original_title": "Alien",
  "overview": "Quando a tripulação da sonda espacial Nostromo responde a um pedido de socorro vindo de um planeta inóspito, eles descobrem uma forma de vida mortal que se reproduz dentro de humanos. Agora, a tripulação deve lutar para permanecer viva e impedir que a criatura chegue até a Terra.",
  "popularity": 550.536,
  "poster_path": "/6f8iChug1FYFu0vLFYLO1YpO1Dz.jpg",
  "production_companies": [
    {
      "id": 25,
      "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
      "name": "20th Century Fox",
      "origin_country": "US"
    },
    {
      "id": 401,
      "logo_path": "/t7mM3DvQ9MwDT3YzMCBrkWpWiiz.png",
      "name": "Brandywine Productions",
      "origin_country": "US"
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "US",
      "name": "United States of America"
    }
  ],
  "release_date": "1979-05-25",
  "revenue": 104931801,
  "runtime": 117,
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    },
    {
      "english_name": "Spanish",
      "iso_639_1": "es",
      "name": "Español"
    }
  ],
  "status": "Released",
  "tagline": "No espaço, ninguém te ouvirá gritar.",
  "title": "Alien: O Oitavo Passageiro",
  "video": false,
  "vote_average": 8.156,
  "vote_count": 14305
}''';
}
