import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/cubit/poi_list_bloc.dart';
import '../../../../../injection_container.dart';

class PoiDetailsView extends StatelessWidget {
  final PoiEntity? poi;

  const PoiDetailsView({super.key, this.poi});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PoiListCubit>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            _buildPoiTitleAndGeocoordenades(),
            _buildPoiImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildPoiTitleAndGeocoordenades() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Title
        Text(
          poi!.title!,
          style: const TextStyle(
              fontFamily: 'Butler', fontSize: 20, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 14),
        // Geocoordenades
        Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 20,
              color: Colors.grey,
            ),
            const SizedBox(width: 4),
            Text(
              poi!.geocoordinates!,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPoiImage() {
    return Hero(
      tag: poi!.id!,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: CachedNetworkImage(
          imageUrl: poi!.image!,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
