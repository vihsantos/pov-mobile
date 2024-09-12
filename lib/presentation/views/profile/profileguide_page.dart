// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/dadosperfil_dto.dart';
import 'package:pov/dto/infoguide_dto.dart';
import 'package:pov/presentation/views/trails/newtrail_page.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/core/utils.dart';
import '../../../models/post/postprofile_model.dart';
import '../../controllers/profilepage_controller.dart';
import '../trails/trails_page.dart';
import 'components/campotitulo.dart';
import 'components/card_postprofile.dart';
import 'components/profile_header.dart';

class ProfileGuidePage extends StatefulWidget {
  final int id;
  final ProfilePageController controller;

  const ProfileGuidePage({
    Key? key,
    required this.id,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileGuidePage> createState() => _ProfileGuidePageState();
}

class _ProfileGuidePageState extends State<ProfileGuidePage> {
  @override
  Widget build(BuildContext context) {
    bool edicaocontato = false;
    bool ativarBotaoSalvar = false;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Perfil",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                              title: const Text("Informações sobre o guia",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorPallete.labelColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              content: FutureBuilder(
                                  future: widget.controller
                                      .buscarInformacoesGuia(widget.id),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return const SizedBox(
                                        height: 100,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }

                                    InfoGuideDTO info = snapshot.data;

                                    return SizedBox(
                                      width: 400,
                                      height: size.height * .36,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CampoTitulo(titulo: "CADASTUR"),
                                          Text(info.cod_cadastur!,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ColorPallete.labelColor)),
                                          const SizedBox(height: 10),
                                          CampoTitulo(
                                              titulo: "Vencimento do CADASTUR"),
                                          Text(
                                              Utils.data(info.data_vencimento!),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ColorPallete.labelColor)),
                                          const SizedBox(height: 10),
                                          CampoTitulo(
                                              titulo: "Áreas de Atuação"),
                                          Text(
                                              Utils.descricaoAreaAtuacao(
                                                  info.areaatuacao!),
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ColorPallete.labelColor)),
                                          const SizedBox(height: 10),
                                          CampoTitulo(titulo: "Estado"),
                                          Text("${info.estado}",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ColorPallete.labelColor)),
                                          const SizedBox(height: 10),
                                          CampoTitulo(titulo: "Município"),
                                          Text("${info.municipio}",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ColorPallete.labelColor)),
                                          const SizedBox(height: 10),
                                          Row(children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CampoTitulo(titulo: "Contato"),
                                                Visibility(
                                                  visible: !edicaocontato,
                                                  child: Text(
                                                      "${info.contato ?? "Não informado!"}",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: ColorPallete
                                                              .labelColor)),
                                                ),
                                                Visibility(
                                                    visible: edicaocontato,
                                                    child: Container(
                                                      width: size.width * 0.458,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          color: ColorPallete
                                                              .bgColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Center(
                                                          child: TextField(
                                                              onChanged: (value) =>
                                                                  widget.controller
                                                                          .contato =
                                                                      value,
                                                              decoration: InputDecoration(
                                                                  hintStyle: TextStyle(
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic),
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText: info
                                                                      .contato)),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                            Visibility(
                                                visible: widget.controller
                                                    .isProfile(widget.id),
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        edicaocontato =
                                                            !edicaocontato;
                                                        if (edicaocontato)
                                                          ativarBotaoSalvar =
                                                              true;
                                                        else
                                                          ativarBotaoSalvar =
                                                              false;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: ColorPallete
                                                          .primaryColor,
                                                    ))),
                                            const SizedBox(width: 5),
                                            Visibility(
                                                visible: ativarBotaoSalvar,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      setState(() {
                                                        ativarBotaoSalvar =
                                                            false;
                                                      });

                                                      if (widget.controller
                                                              .contato ==
                                                          "") {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return const AlertDialog(
                                                                title: Text(
                                                                  "Informe um contato!.",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: ColorPallete
                                                                          .labelColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              );
                                                            });
                                                        return;
                                                      }

                                                      bool enviado =
                                                          await widget
                                                              .controller
                                                              .alterarContato();

                                                      if (!enviado) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Infelizmente o contato não foi salvo, por favor tente novamente!")));
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Contato salvo com sucesso!")));
                                                      }
                                                    },
                                                    icon: Icon(
                                                      Icons.check_outlined,
                                                      color: Colors.green,
                                                      weight: 5,
                                                    )))
                                          ]),
                                        ],
                                      ),
                                    );
                                  }));
                        });
                      });
                },
                icon: const Icon(Icons.info, color: ColorPallete.secondColor)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrailsPage(
                                id: widget.id,
                              )));
                },
                icon: const Icon(Icons.location_on,
                    color: ColorPallete.secondColor)),
            Visibility(
              visible: widget.controller.isProfile(widget.id),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewTrailPage()));
                  },
                  icon: const Icon(
                    Icons.add_location_alt,
                    color: ColorPallete.secondColor,
                  )),
            )
          ],
        ),
        body: Column(children: [
          const SizedBox(height: 15),
          FutureBuilder<DadosPerfilDTO?>(
            future: widget.controller.dadosPerfil(widget.id),
            builder: (context, snapshot) {
              DadosPerfilDTO? dados = snapshot.data;
              if (snapshot.hasError) {
                return const Text("Houve um erro!");
              }

              if (dados == null) {
                return Container();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ProfileHeader(
                      dados: dados,
                      isprofileuser: widget.controller.isProfile(widget.id),
                      user_id: widget.id,
                      profilePageController: widget.controller,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder<List<PostProfileModel>?>(
            future: widget.controller.listarPosts(widget.id),
            builder: (context, snapshot) {
              List<PostProfileModel>? posts = snapshot.data;
              if (snapshot.hasError) {
                return const Text("Houve um erro!");
              }

              if (posts == null) {
                return Container();
              }

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 1 / 1,
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 0),
                  itemCount: widget.controller.posts?.length,
                  itemBuilder: (BuildContext context, index) {
                    return CardPostProfile(
                      post: widget.controller.posts![index],
                    );
                  });
            },
          )),
        ]),
      ),
    );
  }
}
