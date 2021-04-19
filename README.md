Aplicação em produção no heroku: https://cic-overflow.herokuapp.com/

Considerações Finais - PMD 2020-1
Felippe Carvalho e Kipman - 16/0027985
André Bonifácio dos Santos Junior - 17/0137058

Nós iniciamos a disciplina almejando criar uma plataforma para facilitar a disceminação de conhecimento entre os alunos dos cursos de computação. Agora, após quase dois meses de planejamento e mais dois meses de implementação, temos quase um esqueleto de uma aplicação que pode eventualmente vir a desempenhar esse papel.

Planejamento
A parte mais difícil foi decidir o melhor formato para a plataforma assumir. Pensamos em usar uma wiki, com um foco maior em artigos e guias escritos pela comunidade. Consideramos criar um sub-fórum em uma plataforma existente como o reddit, que teria postagens mais curtas com secções de comentários onde discussões interessantes ocorreriam. Por fim, decidimos implementar nossa própria versão de um fórum de dúvidas nos moldes do stack exchange.

Com o formato da nossa plataforma decidido, e com a época de planejamento acabando, nós elencamos as funcionalidades básicas para serem implementadas ao longo da segunda metade da disciplina. Um usuário da nossa plataforma poderá:

Fazer perguntas;
Responder perguntas;
Comentar em perguntas e respostas;
Avaliar perguntas, respostas e comentários;
Pesquisar dentre as perguntas existentes;
Guias?
Ou seja, as funcionalidades básicas de fóruns como o stack exchange. O último ítem ainda remete a uma funcionalidade que nossa plataforma teria se fosse uma wiki, deixando aberta a possibilidade de aliar aspectos dos dois tipos de ambiente. O motivo por ainda nos agarrarmos a essa ideia foi a noção de que existem “known unknowns” e “unknown unknowns”. O primeiro tipo de desconhecido pode ser desvendado fazendo uma pergunta para a pessoa certa. O segundo, contudo, só pode ser descoberto ouvindo a resposta diretamente. Por isso achamos que uma plataforma que aliasse perguntas e respostas (para contemplar known unknowns) com guias (para contemplar unknown unknowns) seria a mais efetiva.

Implementação
A implementação foi feita com Ruby on Rails, um framework prezado por sua facilidade de uso, rápida operacionalização e imensa comunidade. De fato, as maiores dificuldades estavam relacionadas com desvendar a documentação das bibliotecas prontas que existiam para solucionar os problemas encontrados no desenvolvimento, e não implementar soluções para esses problemas do zero. Bibliotecas (ou gemas, na linguagem Ruby) como Devise, Ransack e Acts as Votable oferecem soluções prontas para funcionalidades importantes do nosso projeto (em específico autenticação, busca e votação, respectivamente).

A maior exceção foi configurar o ambiente de produção no Heroku, e mais específicamente o serviço de confirmação de contas por e-mail, e isso em grande parte se deve à qualidade mais baixa da documentação do serviço escolhido pelo grupo (Sendgrid). Inclusive, poucas horas antes da última aula, dia 16/12, o serviço misteriosamente deixou de aceitar nossas credencias de login, tornando impossível um usuário novo se cadastrar. Caso seja necessário fazer login na plataforma para avaliar a produção, deixaremos o login e senha de um usuário já criado ao final deste documento.

Ao final da disciplina, foi possível implementar todas as funcionalidades propostas durante o planejamento (com exceção da verificação de e-mail que estragou inesperadamente durante a última semana). Também vale comentar que a funcionalidade de avaliar comentários foi retirada, pois não ficou claro para o grupo como ela funcionava nos fóruns usados de modelo para o projeto.

Próximos Passos
Como mencionado no início desse ensaio, ao nosso ver, a plataforma está próxima de sua versão 1.0, mas algumas funcionalidades importantes ainda estão ausentes:

Campo com Markdown para melhor formatar o corpo das perguntas e respostas;
Uso de “Tags” para classificar e indexar o conteúdo na plataforma, inicialmente com os seguintes temas (retirados do primeiro tópico do planejamento):
Conteúdo de matérias;
Aspectos organizacionais;
Apoio técnico e;
Inúmeros ajustes no back-end associados com:
Segurança;
Validação de campos;
Testes;
Mensagens de erro e;
Bugs variados.
Para concluir, gostaríamos de retornar ao tópicos de guias. Apesar de não termos encontrado uma maneira natural de integrar essa funcionalidade no nosso fórum, nós identificamos a possibilidade de se criar uma comunidade no Reddit para esse fim, aliando a funcionalidade proposta de guias com o tema da última tag proposta durante o planejamento (omitida na lista anterior): discussões sobre tópicos adjascentes ao curso, como o mercado de trabalho, oportunidades de estágio, cursos extra-curriculares, etc. Quem sabe as duas comunidades (do fórum e do reddit) poderiam ser moderadas por alunos integrantes da CJR ou do CA?

Links
Reddit - uma rede social anônima: https://reddit.com/

Stack Exchange - comunidades de pergunta e resposta: https://stackexchange.com/

Detalhamento do planejamento do projeto realizado ao longo do semestre: http://quizwiki.cic.unb.br/pmd2019-1/index.php/Felippe_Romulo_Andre

Repositório do GitHub: https://github.com/TheKipmaster/cicoverflow

Aplicação em produção no heroku: https://cic-overflow.herokuapp.com/

Credenciais de teste - (login: admin@email.com | senha: 123456)
