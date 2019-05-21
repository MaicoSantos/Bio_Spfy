Quando('consulto a playlist de um usuário específico') do
  @response = ApiSpotify.new.listar_playlists
end

Quando('incluo uma música na playlist de um usuário específico') do
  @response = ApiSpotify.new.listar_playlists
  id_playlist = @response['items'][0]['id']
  @response = ApiSpotify.new.incluir_musica(id_playlist)
end

Quando('consulto uma playlist específica usando filtro por campos') do
  @response = ApiSpotify.new.listar_playlists
  id_playlist = @response['items'][0]['id']
  @response = ApiSpotify.new.detalhes_playlists(id_playlist)
end

Quando('remover uma música de uma playlist específica') do
  @response = ApiSpotify.new.listar_playlists
  id_playlist = @response['items'][0]['id']
  @response = ApiSpotify.new.deletar_musica(id_playlist)
end

Então('o retorno do status code deve ser {int}') do |status_code|
  expect(@response.code).to eq status_code
end

E('retorna todas as playlists do usuário') do
  expect(@response['items']).not_to be_empty
end

E('a musica é incluida com sucesso') do
  snapshot_id = @response['snapshot_id']
  expect(snapshot_id).not_to be_empty
  @response = ApiSpotify.new.listar_playlists
  expect(@response['items'][0]['snapshot_id']).to eq snapshot_id
end

E('os detalhes da playlist são exibidos conforme filtro aplicado') do
  massa = USER_DATA['data']
  expect(@response['tracks']['items'].map { |item| item['track']['uri'] }).to include(massa['uri'])
  expect(@response['id']).not_to be_empty
  expect(@response['name']).not_to be_empty
  expect(@response['tracks']['items']).not_to be_empty
end

E('a música é excluida com sucesso') do
  massa = USER_DATA['data']
  @response = ApiSpotify.new.listar_playlists
  id_playlist = @response['items'][0]['id']
  @response = ApiSpotify.new.detalhes_playlists(id_playlist)
  expect(@response['tracks']['items'].map { |item| item['track']['uri'] }).not_to include(massa['uri'])
end
