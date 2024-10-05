class Routes {
  //static const String urlPartial = "https://vihsantos.pythonanywhere.com";
  static const String urlPartial = "http://192.168.0.110:8000";

  static const String login = "$urlPartial/acesso";
  static const String novoUsuario = "$urlPartial/criarusuario";
  static const String usuario = "$urlPartial/usuario/";
  static const String novoPost = "$urlPartial/newpost";
  static const String post = "$urlPartial/post";
  static const String posts = "$urlPartial/posts";
  static const String profilePosts = "$urlPartial/profileposts";
  static const String rankingByLocal = "$urlPartial/ranking/local";
  static const String searchRankingByLocal = "$urlPartial/ranking";
  static const String guides = "$urlPartial/guides";
  static const String trail = "$urlPartial/newtrail";
  static const String trails = "$urlPartial/trails";
  static const String findTrail = "$urlPartial/trail";
  static const String commentsByPosts = "$urlPartial/commentByPost";
  static const String commentsByTrails = "$urlPartial/commentByTrails";
  static const String comment = "$urlPartial/comment";
  static const String following = "$urlPartial/following";
  static const String unfollow = "$urlPartial/unfollow";
  static const String addicon = "$urlPartial/addProfileIcon";
  static const String isFollower = "$urlPartial/isfollower";
  static const String infoGuide = "$urlPartial/infoguide";
  static const String municipioPorUF = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/";
  static const String addVooInPost = "$urlPartial/addvooinpost/";
  static const String removeVooInPost = "$urlPartial/removevooinpost/";
  static const String searchGuides = "$urlPartial/searchguide/";
  static const String deletePost = "$urlPartial/removepost";
  static const String deleteTrail = "$urlPartial/removetrail";
  static const String allPosts = "$urlPartial/allPosts";
  static const String buscarUser = "$urlPartial/findUser";
  static const String alterarSenha = "$urlPartial/alterarsenha";
  static const String informarContato = "$urlPartial/alterarContato/";
  static const String getPostFolowing = "$urlPartial/getPostFollowing";
}
