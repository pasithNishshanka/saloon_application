

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name, image;

  getthedatafromsharedpref() async {
    name = await SharedpreferenceHelper().getUserName();
    image = await SharedpreferenceHelper().getUserImage();
    setState(() {});
  }

  getontheload() async {
    await getthedatafromsharedpref();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 31, 32),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      name ?? 'Guest',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 134, 93, 5),
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: image != null
                      ? Image.network(
                          image!,
                          height: 60.0,
                          width: 60.0,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assest/images/man1.jpeg",
                          height: 60.0,
                          width: 60.0,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(
              color: Colors.white60,
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Services",
              style: TextStyle(
                color: Color.fromARGB(255, 248, 248, 248),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildServiceRow(
                      context,
                      'Beard Shave Style',
                      'assest/images/beard_shave1.png',
                      'Hair Cut Style',
                      'assest/images/hair_cut.png',
                    ),
                    const SizedBox(height: 20.0),
                    _buildServiceRow(
                      context,
                      'Hair Coloring',
                      'assest/images/hair_color.png',
                      'Facial Treatment',
                      'assest/images/facial_treatment.png',
                    ),
                    const SizedBox(height: 20.0),
                    _buildServiceRow(
                      context,
                      'Head Massage',
                      'assest/images/head_massage.png',
                      'Body Massage',
                      'assest/images/body_massage.png',
                    ),
                    const SizedBox(height: 20.0),
                    _buildServiceRow(
                      context,
                      'Foot Treatment',
                      'assest/images/foot_treatment.png',
                      'Advising',
                      'assest/images/advising.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceRow(BuildContext context, String service1, String image1, String service2, String image2) {
    return Row(
      children: [
        _buildServiceTile(context, service1, image1),
        const SizedBox(width: 10.0),
        _buildServiceTile(context, service2, image2),
      ],
    );
  }

  Widget _buildServiceTile(BuildContext context, String service, String image) {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Booking(service: service)),
          );
        },
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Image.asset(image, height: 150, width: 150),
              const SizedBox(height: 10.0),
              Text(
                service,
                style: const TextStyle(
                  color: Color.fromARGB(255, 11, 8, 2),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
