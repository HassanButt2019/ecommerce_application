part of 'view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController? _search = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static Route route() => MaterialPageRoute(builder: (_) => HomeScreen());
  final List imagesList = [
    ConstantPath.getPath('1.jpeg'),
    ConstantPath.getPath('2.jpeg'),
    ConstantPath.getPath('3.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: ConstantColors.backgroundColor,
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _crousalWidget(height, width),
                  Positioned(
                    top: 50,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CupertinoTextField(
                          placeholder: 'Search....',
                          placeholderStyle: TextStyle(
                              color: ConstantColors.categoryHeadingColor),
                          prefix: IconButton(
                              onPressed: () {
                                if (_scaffoldKey.currentState!.isDrawerOpen) {
                                  _scaffoldKey.currentState!.openEndDrawer();
                                } else {
                                  _scaffoldKey.currentState!.openDrawer();
                                }
                              },
                              icon: const Icon(
                                Icons.sort,
                                size: 35,
                              )),
                          suffix: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 35,
                              )),
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                          controller: _search,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _categories(height, width, context),
              _popularIList(height, width),
              _freshSaleList(width, height)
            ],
          ),
        ),
      ),
    );
  }

  Widget _crousalWidget(double height, double width) {
    return SizedBox(
      height: height * 0.47,
      width: width,
      child: carouselSliderWidget(height, width),
    );
  }

  Widget carouselSliderWidget(double height, double width) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 19 / 16,
        viewportFraction: 1,
        autoPlayAnimationDuration: const Duration(milliseconds: 200),
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imagesList
          .map((item) => Stack(
                children: [
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.hardLight),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: DotsIndicator(
                      dotsCount: imagesList.length,
                      position: imagesList.indexOf(item).toDouble(),
                      decorator: const DotsDecorator(
                        color: Color(0xfff5f5f5), // Inactive color
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }

  Card _freshSaleList(double width, double height) {
    return Card(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _headingText("Fresh Sale"),
                  ClickableText(
                    ontap: () {},
                    label: 'Show more',
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 35,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.45,
                  height: height * 0.23,
                  child: Column(
                    children: [
                      SizedBox(
                          width: width * 0.25,
                          height: height * 0.18,
                          child: Image.asset(
                            ConstantPath.getPath('mac.jpeg'),
                            fit: BoxFit.fill,
                          )),
                      _headingText("Glaxy Note 9"),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 5,
                  thickness: 10,
                  color: ConstantColors.backgroundColor,
                ),
                Column(
                  children: [
                    _saleItem(height, width),
                    _saleItem(height, width)
                  ],
                )
              ],
            )
          ],
        ));
  }

  Card _popularIList(double height, double width) {
    return Card(
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: _headingText("Popular Keywords"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _popularItem(height, width),
                _popularItem(height, width),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _popularItem(height, width),
                _popularItem(height, width),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _categories(double height, double width,BuildContext context) {
    return RepositoryProvider(
      create: (context) => HomeRepository(),
      child: BlocProvider(
        create: (context) =>
            HomeBloc(RepositoryProvider.of<HomeRepository>(context))..add(LoadCategories()),
        child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is HomeFailure) {
            return Center(
              child: ScaffoldMessenger(child: Text(state.error.toString()),),
            );
          }
          print(state);
          if(state is CategorySuccess )
            {
              return Card(
                margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _headingText("Categories"),
                          ClickableText(
                            ontap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryList(categories: state.categories??[])));
                            },
                            label: 'Show more',
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 10,
                      children: state.categories!.take(6).map((i) => _categoryItem(height, width ,label: i.name,icon: Icons.category )).toList(),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }

          return Card(
            margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _headingText("Categories"),
                            ClickableText(
                              ontap: () async {
                                GeneralFunctions.navigateTo(
                                    context, CategoryList.route());
                              },
                              label: 'Show more',
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    Row(
                        children: [
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.bookOpen,
                              onpressed: () {},
                              label: 'Books'),
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.fish,
                              onpressed: () {},
                              label: 'Foods'),
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.headphones,
                              onpressed: () {},
                              label: 'Electronics'),
                        ],
                      ),
                      Row(
                        children: [
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.computer,
                              onpressed: () {},
                              label: 'Computers'),
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.phone,
                              onpressed: () {},
                              label: 'Cellphones'),
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.print,
                              onpressed: () {},
                              label: 'Offices'),
                        ],
                      ),
                      Row(
                        children: [
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.shoePrints,
                              onpressed: () {},
                              label: 'Shoes'),
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.shirt,
                              onpressed: () {},
                              label: 'Fashions'),
                          _categoryItem(height, width,
                              icon: FontAwesomeIcons.wallet,
                              onpressed: () {},
                              label: 'Collections'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
          );
        }),
      ),
    );
  }

  Widget _saleItem(double height, double width) {
    return SizedBox(
      height: height * 0.08,
      width: width * 0.47,
      child: Row(
        children: [
          SizedBox(
              width: width * 0.16,
              height: height * 0.18,
              child: Image.asset(
                ConstantPath.getPath('mac.jpeg'),
                fit: BoxFit.contain,
              )),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _popularheadingText("Macbook"),
              _subTitleText('\$999.00 (-75%)', lineThrough: true),
            ],
          )
        ],
      ),
    );
  }

  Container _popularItem(double height, double width) {
    return Container(
      height: height * 0.08,
      width: width * 0.47,
      color: ConstantColors.backgroundColor,
      child: Row(
        children: [
          SizedBox(
              width: width * 0.16,
              height: height * 0.18,
              child: Image.asset(ConstantPath.getPath('mac.jpeg'))),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _popularheadingText("Macbook"),
              _subTitleText("155 Products"),
            ],
          )
        ],
      ),
    );
  }

  Container _categoryItem(double height, double width,
      {onpressed, icon, label}) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: height * 0.15,
      width: width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: onpressed,
              icon: FaIcon(
                icon,
                size: 45,
                color: Colors.black,
              )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              label.toString(),
              style: TextStyle(
                  fontSize: 13, color: ConstantColors.categoryHeadingColor),
            ),
          ),
        ],
      ),
    );
  }

  Text _headingText(String heading) => Text(
        heading,
        style: TextStyle(fontSize: 20, color: ConstantColors.textHeadingColor),
      );

  Text _popularheadingText(String heading) => Text(
        heading,
        style: TextStyle(fontSize: 16, color: ConstantColors.textHeadingColor),
      );
  Text _subTitleText(String heading, {bool? lineThrough = false}) => Text(
        heading,
        style: TextStyle(
            decoration: lineThrough! ? TextDecoration.lineThrough : null,
            fontSize: 14,
            color: ConstantColors.categoryHeadingColor),
      );
}
