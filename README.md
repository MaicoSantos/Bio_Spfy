# Projeto
Automação de Testes de API usando Ruby/Cucumber/HTTParty

#### Obtenção de Token:
```
Conforme orientação foi criada uma conta no spotify e incluída uma playlist e algumas músicas, o login da conta é:

usuário: klebson.leite@mailinator.com
senha: Teste@123

Obs: Após obter o token o mesmo deve ser inserido no arquivo "user_data.yml" no campo "token"
```

###Clonar o projeto:
```
$ git clone https://github.com/kstayner/Bio_Spfy.git
```

###Na pasta do projeto instalar as dependências executando o comando:
```
$ bundle install
```

#### Os testes do desafio podem ser executado de forma independente utilizando a sua respectiva tag:
```
Entrar na pasta do projeto e executar os comandos de Exemplo:

$ bundle exec cucumber -t @listar_playlist
$ bundle exec cucumber -t @incluir_musica
$ bundle exec cucumber -t @detalhes_playlist
$ bundle exec cucumber -t @remover_musica
$ bundle exec cucumber -t @incluir_musica_sem_token
$ bundle exec cucumber -t @listar_playlist_com_endpoint_errado
$ bundle exec cucumber -t @remover_musica_com_playlist_inexistente
$ bundle exec cucumber -t @consultar_playlist_token_expirado

```

#### Para executar todo os cenários:
```
Entrar na pasta do projeto e executar o comando de Exemplo:

$ bundle exec cucumber -t @todos
```

#### Relatório:
```
Na raiz do projeto na pasta "relatório", será salvo um relaório do cucumber em html
```
