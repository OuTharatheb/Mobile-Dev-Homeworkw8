import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData MyProfile = ProfileData(
  name: "Ratheb",
  position: "Flutter Student",
  avatarUrl: 'assets/w5-s2/kazuha.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "097 99 98 282"),
    TileData(icon: Icons.location_on, title: "Address", value: "Phnom Penh"),
    TileData(icon: Icons.email, title: "Mail", value: "tharatheb.ou@gmail.com"),
  ],
);
