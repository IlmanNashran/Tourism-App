import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidht;

  List<String> _locations = ['Mentakab', 'Japan', 'Temerloh', 'London'];
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(
            _deviceWidht! * 0.05, 0, _deviceWidht! * 0.05, 0),
        child: _mainColumn(context),
      ),
    );
  }

//display all row in clumn
  Widget _mainColumn(_context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _topBar(),
        Padding(
          padding: EdgeInsets.only(
            top: _deviceHeight! * 0.03,
          ),
          child: _locationsBarWidget(_context),
        ),
      ],
    );
  }

//top bar row in column
  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        Container(
          height: 39,
          width: 144,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/logo_discover.png'),
            ),
          ),
        ),
        const Icon(
          Icons.search,
          color: Colors.black87,
        ),
      ],
    );
  }

  //second row in column for location bar
  Widget _locationsBarWidget(BuildContext _context) {
    return Container(
      height: _deviceHeight! * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((e) {
          bool _isActive = _locations[_activeLocation] == e ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                e,
                style: TextStyle(
                  fontSize: 15,
                  color: _isActive ? Colors.white : Colors.white54,
                  fontFamily: 'Montserrat',
                ),
              ),
              _isActive
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.redAccent,
                      ),
                      height: 5,
                      width: 40,
                    )
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
