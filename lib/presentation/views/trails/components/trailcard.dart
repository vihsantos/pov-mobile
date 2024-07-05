// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/presentation/views/trails/traildetails_page.dart';
import 'package:pov/services/core/utils.dart';
import '../../../../services/core/colorpallete.dart';

class TrailCard extends StatefulWidget {
  final TrailDTO trilha;

  const TrailCard({
    Key? key,
    required this.trilha,
  }) : super(key: key);

  @override
  State<TrailCard> createState() => _TrailCardState();
}

class _TrailCardState extends State<TrailCard> {
  int indexSelecionado = 0;
  PageController? pageController;

  @override
  void initState() {
    pageController =  PageController(initialPage: indexSelecionado);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var urls = widget.trilha.files!.split(";");
    urls.removeLast();

    

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TrailDetailsPage(id: widget.trilha.id!)));
      },
      child: Container(
        width: size.width * 0.92,
        height: size.height * 0.33,
        decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 12),
            SizedBox(
              width: size.width * 0.87,
              height: 180,
              child: Stack(
                children: [
                  SizedBox(
                    height: 165,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: urls.length,
                        controller: pageController,
                        onPageChanged: (index){
                          setState(() {
                            indexSelecionado = index; 
                          });
                        },
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return Image.network(
                            urls[itemIndex],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 170,
                    right: 170,
                    child: Row(
                      children: [
                        ...List.generate(
                            2,
                            (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: indexSelecionado == index? Colors.pink : Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(widget.trilha.name!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorPallete.secondColor),
                maxLines: 2,
                textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                Utils.descricaoAreaAtuacao(widget.trilha.occupation!),
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: ColorPallete.labelColor),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorPallete.bgColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: widget.trilha.user!.profile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                widget.trilha.user!.profile!,
                                fit: BoxFit.cover,
                              ))
                          : const Icon(
                              Icons.person,
                              color: ColorPallete.labelColor,
                            ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.trilha.user!.username!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPallete.labelColor),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
