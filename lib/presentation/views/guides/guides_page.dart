import 'package:flutter/material.dart';
import 'package:pov/dto/guide_dto.dart';
import 'package:pov/dto/municipio_dto.dart';
import 'package:pov/presentation/controllers/guidespage_controller.dart';
import 'package:pov/presentation/views/guides/components/guidecard.dart';
import 'package:pov/presentation/widgets/input_field.dart';
import 'package:pov/repository/guide_repository.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/core/utils.dart';

class GuidesPage extends StatefulWidget {
  const GuidesPage({super.key});

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  GuidesPageController controller = GuidesPageController(GuideRepository());

  @override
  void initState() {
    controller.listarGuias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.filter_alt_rounded,
                  color: ColorPallete.secondColor,
                ),
                onPressed: () {
                  searchGuides(context, controller);
                },
              ),
              title: const Text(
                "Guias",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: ColorPallete.labelColor),
              ),
            ),
            body: ValueListenableBuilder<bool?>(
              valueListenable: controller.loadingApi,
              builder: (_, loading, __) {
                if (loading!) {
                  return const Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 260, childAspectRatio: 3 / 4),
                    itemCount: controller.guias!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      GuideDTO? guia = controller.guias![index];

                      return GuideCard(guia: guia);
                    });
              },
            )));
  }

  Future<dynamic> searchGuides(
      BuildContext context, GuidesPageController controller) {
    Size size = MediaQuery.of(context).size;

    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Filtrar Guias",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.labelColor)),
                    ),
                    InputField(
                        label: "Estado",
                        child: DropdownMenu<String>(
                          hintText: "Selecione o estado...",
                          requestFocusOnTap: true,
                          onSelected: (value) {
                            setState(() {
                              controller.estado = value;
                            });
                          },
                          enableSearch: true,
                          menuStyle: const MenuStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                ColorPallete.bgItemColor),
                          ),
                          inputDecorationTheme: const InputDecorationTheme(
                            border: InputBorder.none,
                          ),
                          width: size.width * 0.9,
                          menuHeight: 200,
                          dropdownMenuEntries:
                              Utils.listarUFs().map((String uf) {
                            return DropdownMenuEntry<String>(
                                value: uf, label: uf);
                          }).toList(),
                        )),
                    InputField(
                        label: "Munícipio",
                        child: controller.estado == " "
                            ? const SizedBox(
                              height: 60,
                            )
                            : FutureBuilder<List<MunicipioDTO?>?>(
                                future: controller
                                    .listarMunicipiosPorUF(controller.estado!),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  List<MunicipioDTO>? dados = snapshot.data;

                                  if (dados != null) {
                                    return DropdownMenu<MunicipioDTO>(
                                        onSelected: (value) {
                                          controller.municipio = value!.nome;
                                        },
                                        requestFocusOnTap: true,
                                        enableSearch: true,
                                        menuStyle: const MenuStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  ColorPallete.bgItemColor),
                                        ),
                                        inputDecorationTheme:
                                            const InputDecorationTheme(
                                          border: InputBorder.none,
                                        ),
                                        width: size.width * 0.9,
                                        menuHeight: 200,
                                        dropdownMenuEntries:
                                            dados.map((MunicipioDTO municipio) {
                                          return DropdownMenuEntry<
                                                  MunicipioDTO>(
                                              value: municipio,
                                              label: municipio.nome!);
                                        }).toList());
                                  }

                                  return Container();
                                })),
                    InkWell(
                      onTap: () {
                        bool temEstado = controller.estado != " ";
                        bool temMunicipio = controller.municipio != " ";
                        if (!temEstado & !temMunicipio) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                    "Não foi possível filtrar guias, você tem que selecionar alguma informação.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorPallete.labelColor),
                                  ),
                                );
                              });
                          return;
                        }
                        controller.filtrarGuias();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        width: size.width,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                            color: ColorPallete.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Filtrar",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
