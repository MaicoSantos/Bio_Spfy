Before('@hook_apagar') do
  list_playlist = ApiSpotify.new.listar_playlists
  id_playlist = list_playlist['items'][0]['id']
  ApiSpotify.new.deletar_musica(id_playlist)
  consult_musica = ApiSpotify.new.detalhes_playlists(id_playlist)
  massa = USER_DATA['data']
  expect(consult_musica['tracks']['items'].map { |item| item['track']['uri'] }).not_to include(massa['uri'])
end

Before('@hook_incluir') do
  response = ApiSpotify.new.listar_playlists
  id_playlist = response['items'][0]['id']
  response = ApiSpotify.new.incluir_musica(id_playlist)
  snapshot_id = response['snapshot_id']
  expect(snapshot_id).not_to be_empty
end
