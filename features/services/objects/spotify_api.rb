# Class Api do Spotify
class ApiSpotify
  include HTTParty

  base_uri ENVIRONMENT['api']
  format :json

  def initialize
    @http_headers = {
      'Content-Type' => 'application/json',
      'Connection' => 'keep-alive'
    }
    @token = USER_DATA['data']['token']
    @token_expirado = USER_DATA['data']['token_expirado']
    @uri_track = USER_DATA['data']['uri_track']
  end

  def listar_playlists
    @http_headers['Authorization'] = @token
    self.class.get('/me/playlists', headers: @http_headers)
  end

  def incluir_musica(playlist_id)
    @http_headers['Authorization'] = @token
    self.class.post("/playlists/#{playlist_id}/tracks", headers: @http_headers, body: @uri_track)
  end

  def detalhes_playlists(playlist_id)
    @http_headers['Authorization'] = @token
    self.class.get("/playlists/#{playlist_id}?fields=id%2C%20name%2C%20tracks(total%2C%20items(track(name%2C%20artists%2C%20href%2C%20album(name%2Chref)%2C%20uri)))", headers: @http_headers)
  end

  def deletar_musica(playlist_id)
    @http_headers['Authorization'] = @token
    self.class.delete("/playlists/#{playlist_id}/tracks", headers: @http_headers, body: @uri_track)
  end

  def incluir_musica_sem_token(playlist_id)
    self.class.post("/playlists/#{playlist_id}/tracks", headers: @http_headers, body: @uri_track)
  end

  def listar_playlists_com_endpoint_errado
    @http_headers['Authorization'] = @token
    self.class.get('/me/playlistss', headers: @http_headers)
  end

  def token_expirado
    @http_headers['Authorization'] = @token_expirado
    self.class.get('/me/playlists', headers: @http_headers)
  end
end
