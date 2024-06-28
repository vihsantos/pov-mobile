import 'package:flutter/material.dart';
import 'package:pov/dto/municipio_dto.dart';
import 'package:pov/models/enums/AreaAtuacao.dart';
import 'package:pov/presentation/controllers/registerpage_controller.dart';
import 'package:pov/presentation/views/register/components/button_next.dart';
import 'package:pov/presentation/widgets/input_field.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/core/utils.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  final RegisterPageController controller;
  final Function() onTap;

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Informações do guia",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ColorPallete.primaryColor),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: size.width,
          height: size.height * 0.64,
          child: PageView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    InputField(
                        label: "Estado",
                        child: DropdownMenu<String>(
                          requestFocusOnTap: true,
                          onSelected: (value) {
                            widget.controller.usuario.estado = value;
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
                          dropdownMenuEntries: Utils.listarUFs().map((String uf) {
                            return DropdownMenuEntry<String>(
                                value: uf, label: uf);
                          }).toList(),
                        )),
                    InputField(
                        label: "Municipio",
                        child: widget.controller.usuario.estado == null
                            ? Container()
                            : FutureBuilder<List<MunicipioDTO?>?>(
                                future: widget.controller.listarMunicipiosPorUF(
                                    widget.controller.usuario.estado!),
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
                                          widget.controller.usuario.municipio =
                                              value!.nome;
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
                                          return DropdownMenuEntry<MunicipioDTO>(
                                              value: municipio,
                                              label: municipio.nome!);
                                        }).toList());
                                  }
                          
                                  return Container();
                                })),
                    InputField(
                      label: "Área de Atuação",
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          spacing: 2.0,
                          children: AreaAtuacao.values.map((AreaAtuacao area) {
                            return FilterChip(
                              label: Text(
                                area.descricao,
                                maxLines: 2,
                              ),
                              selected: widget.controller.filters.contains(area),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    widget.controller.filters.add(area);
                                  } else {
                                    widget.controller.filters.remove(area);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Text(
                      "Arraste para o lado >>",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  InputField(
                    label: 'Numero do Cadastur',
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: TextField(
                        onChanged: (value) =>
                            widget.controller.usuario.cadastur = value,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Digite o numero do Cadastur"),
                      ),
                    ),
                  ),
                  InputField(
                    label: 'Data de Vencimento',
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: TextField(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 10));
          
                          if (date != null) {
                            setState(() {
                              widget.controller.usuario.data_vencimento = date;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle:
                              const TextStyle(fontStyle: FontStyle.italic),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: widget.controller.usuario.data_vencimento ==
                                  null
                              ? "Informe a data de vencimento do Cadastur"
                              : Utils.data(
                                  widget.controller.usuario.data_vencimento!),
                        ),
                      ),
                    ),
                  ),
                  ButtonNext(onTap: widget.onTap)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
