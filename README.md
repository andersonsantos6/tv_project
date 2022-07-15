<h1 align="center">VTV - TV para Todos</h1>

<h2>Sobre o Projeto</h2>
<i>Este é um projeto pessoal com fins educacionais. O mesmo foi desenvolvido com objetivo de concretizar o aprendizado durante minha formação e ampliar meus conhecimentos em vários conceitos na área da programação, desde UX/UI até Arquitetura. </i>
<h2>Tecnologias</h2>
<p>
<img src="https://user-images.githubusercontent.com/99498850/179290614-0acf407b-dccc-4c90-be94-410a29e6ca8d.png" height =50>
<img src="https://user-images.githubusercontent.com/99498850/179290887-45e0086b-a0aa-4ab9-b122-8d339b4f656d.png" height =50>
</p>


</P>

<h2>Login Page</h2>
<p>No sistema de login, foi utilizado o recurso Authentication do Firebase, sendo E-mail e senha, o principal provedor de Sing-in Method.</p>
<p>
<img src="https://user-images.githubusercontent.com/99498850/179295073-753832fd-b630-49f2-a942-4666c20c1711.png"height = 400>
<img src="https://user-images.githubusercontent.com/99498850/179295076-1347af28-c5df-40f7-89f6-cdc413c2965d.png" height = 400>
</p>
<h2>Home Page</h2>
<p>
A pagina inicial do App foi feita utilizando uma ListView que renderiza uma lista de widgets, filtrando os canais por categoria. Cada widget de canal foi envolvido por um Inkwell que chama a função Navigator, passando os dados do canal selecionado através de um model como argumento para pagina de Player.
</p>

<p>
<img src="https://user-images.githubusercontent.com/99498850/179297139-bfa7ce11-aac1-4896-bbda-42a9c40af426.png" height = 400 >
<img src="https://user-images.githubusercontent.com/99498850/179296686-db7c4509-24af-4b93-be13-552da469b955.png" height = 400>
</p>

<h2>Player Page</h2>
<p>
Dentro da Página onde é reproduzido os canais, foi utilizado o Package <i>video_player</i>, responsável por consumir o link m3u dos canais através do model passado como argumento da página home.
</p>

<p>
<img src="https://user-images.githubusercontent.com/99498850/179299882-f68a48b2-b1ac-4764-9902-b12aac8e02b0.png" height = 400 >
<img src="https://user-images.githubusercontent.com/99498850/179296686-db7c4509-24af-4b93-be13-552da469b955.png" height = 400>
</p>

<h2>Search Page</h2>

<p>
A Página de busca consiste em filter functions,que comparam letras do controller com os titulos dos objetos (channelModel) que foram requisitados no database. 
<p>List<ChannelModel> channelSearch(
      List<ChannelModel> listChannel, String value) {
    return listChannel
        .where(
          (ch) =>
              ch.title.toLowerCase().contains(value.toString().toLowerCase()),
        )
        .toList();
  }
  </p>
  
 <p> <img src="https://user-images.githubusercontent.com/99498850/179300742-46d7c059-9368-41fe-bbdc-9cf1463c58f2.png" height = 400 >
  <img src="https://user-images.githubusercontent.com/99498850/179300743-8aed40b5-262f-4bb4-8976-9db781e367e1.png" height = 400>
  <img src="https://user-images.githubusercontent.com/99498850/179300745-ef8f4e1d-72ca-4ada-9b82-2b6d50f8a939.png" height = 400 >
  <img src="https://user-images.githubusercontent.com/99498850/179300747-a3c0971f-d8e7-4913-954f-a21bbd50d370.png" height = 400>
  </p>
</p>
<h2>Repository</h2>
<p>
Os dados do repositório são requisitados no firebase e salvos em um provider, onde é distribuido em toda aplicação. (Obs. o endpoint do banco foi censurado por motivos de segurança S2 )
<p><img src="https://user-images.githubusercontent.com/99498850/179301436-3f46e3c9-ac42-4049-90f6-5917694a1446.PNG" height = 400 ></p>

</p>
