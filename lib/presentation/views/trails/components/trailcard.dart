import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/presentation/views/trails/traildetails_page.dart';
import 'package:pov/services/core/colorpallete.dart';

// ignore: must_be_immutable
class TrailCard extends StatefulWidget {
  TrailDTO trilha;

  TrailCard({
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
    pageController = PageController(initialPage: indexSelecionado);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var urls = widget.trilha.files!.split(";");
    urls.removeLast();

int indexExibir = indexSelecionado +1;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TrailDetailsPage(id: widget.trilha.id!)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
            width: size.width * .9,
            height: size.height * .29,
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: urls.length,
                  controller: pageController,
                  onPageChanged: (index) {
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
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    width: size.width * .4,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        color: ColorPallete.bgItemColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.height * .04,
                            height: size.height * .04,
                            decoration: BoxDecoration(
                                color: ColorPallete.labelColor,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.trilha.user!.username!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ColorPallete.labelColor,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    width: size.height * .05,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        color: ColorPallete.bgItemColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(child: Text("$indexExibir", style: TextStyle(color: ColorPallete.primaryColor, fontWeight: FontWeight.w800,),)),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Container(
                    width: size.width,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        color: ColorPallete.bgItemColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        widget.trilha.name!,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorPallete.primaryColor),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
