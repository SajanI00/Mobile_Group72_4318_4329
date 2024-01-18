import 'package:flutter/material.dart';
import 'package:pet_adoption_app/core/constants/constants.dart';

class HomeFound extends StatefulWidget {
  const HomeFound({Key? key}) : super(key: key);

  static const routeName = '/found';

  @override
  State<HomeFound> createState() => _HomeState();
}

class _HomeState extends State<HomeFound> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: _appText(),
            elevation: 0,
            bottom: TabBar(
              tabs: [_lostButtonWidget(), _foundButtonWidget()],
              controller: _tabController,
              indicator: BoxDecoration(
                  color: const Color(0xffa1e1a3),
                  borderRadius: BorderRadius.circular(6.0)),
              onTap: (index) {
                setState(() {});
              },
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: Constants.screens,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: const Icon(Icons.add),
          ),
        ));
  }

  Widget _appText() => const Text(
        'Lost and Found',
        style: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      );

  Widget _lostButtonWidget() => const TextButton(
        onPressed: null,
        child:
            Text('Lost', style: TextStyle(color: Colors.white, fontSize: 18)),
      );

  Widget _foundButtonWidget() => const TextButton(
        onPressed: null,
        child:
            Text('Found', style: TextStyle(color: Colors.white, fontSize: 18)),
      );
}
