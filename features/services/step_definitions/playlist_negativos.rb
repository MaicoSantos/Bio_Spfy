Quando('incluo uma música na playlist sem token') do
  @response = ApiSpotify.new.listar_playlists
  id_playlist = @response['items'][0]['id']
  @response = ApiSpotify.new.incluir_musica_sem_token(id_playlist)
end

Quando('consulto a playlist com endpoint errado') do
  @response = ApiSpotify.new.listar_playlists_com_endpoint_errado
end

Quando('removo a musica de uma playlist inexistente') do
  @response = ApiSpotify.new.deletar_musica('5EivU2ZEim9mgQ8AOgiLUY')
end

Quando('consulto a playlist com token expirado') do
  @response = ApiSpotify.new.token_expirado
end

E('retorna a mensagem {string}') do |mensagem|
  expect(@response['error']['message']).to eq mensagem
end
