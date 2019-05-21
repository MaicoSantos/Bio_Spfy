# language: pt

Funcionalidade: Playlist
Como um cliente da API
Eu quero realizar as requisições nos principais metodos
A fim de garantir o correto funcionamento

  @listar_playlist @todos
  Cenário: Listar todas as playlists
    Quando consulto a playlist de um usuário específico
    Então o retorno do status code deve ser 200
    E retorna todas as playlists do usuário

  @incluir_musica @todos @hook_apagar
  Cenário: Incluir uma música na playlist
    Quando incluo uma música na playlist de um usuário específico
    Então o retorno do status code deve ser 201
    E a musica é incluida com sucesso

  @detalhes_playlist @todos
  Cenário: Listar detalhes de uma playlist
    Quando consulto uma playlist específica usando filtro por campos
    Então o retorno do status code deve ser 200
    E os detalhes da playlist são exibidos conforme filtro aplicado

  @remover_musica @todos @hook_incluir
  Cenário: Remover musica da playlist
    Quando remover uma música de uma playlist específica
    Então o retorno do status code deve ser 200
    E a música é excluida com sucesso  
