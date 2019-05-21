# language: pt

Funcionalidade: Cenários negativos Playlist
Como usuário da API
Para validar cenários negativos da API
Eu envio dados errados/branco

  @incluir_musica_sem_token @todos
  Cenário: Token nulo
    Quando incluo uma música na playlist sem token
    Então o retorno do status code deve ser 401
    E retorna a mensagem "No token provided"

  @listar_playlist_com_endpoint_errado @todos
  Cenário: Edpoint errado
    Quando consulto a playlist com endpoint errado
    Então o retorno do status code deve ser 404
    E retorna a mensagem "Service not found"

  @remover_musica_com_playlist_inexistente @todos
  Cenário: Playlist inexistente
    Quando removo a musica de uma playlist inexistente
    Então o retorno do status code deve ser 403
    E retorna a mensagem "Insufficient client scope"

  @consultar_playlist_token_expirado @todos
  Cenário: Token expirado
    Quando consulto a playlist com token expirado
    Então o retorno do status code deve ser 401
    E retorna a mensagem "The access token expired"
