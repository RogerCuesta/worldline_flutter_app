import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldline_flutter_app/src/config/l10n/l10n.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/cubit/poi_list_bloc.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/cubit/poi_list_state.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/widgets/poi_card.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/widgets/poi_search_widget.dart';

class PoiListView extends StatefulWidget {
  const PoiListView({Key? key}) : super(key: key);

  @override
  PoiListViewState createState() => PoiListViewState();
}

class PoiListViewState extends State<PoiListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    final l10n = context.l10n;
    return AppBar(
      title: Text(
        l10n.appTitle,
      ),
    );
  }

  _buildBody(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        SearchWidget(
          controller: _searchController,
          onSubmitted: (text) {
            if (text != null) {
              context.read<PoiListCubit>().filterPOIList(text);
              FocusScope.of(context).unfocus();
            }
          },
        ),
        Expanded(
          child: BlocBuilder<PoiListCubit, PoiListState>(
            builder: (_, state) {
              if (state is PoiListLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state is PoiListError) {
                return const Center(child: Icon(Icons.refresh));
              }
              if (state is PoiListEmpty) {
                return Center(child: Text(l10n.noDataText));
              }
              if (state is PoiListDone) {
                return SafeArea(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return PoiCard(
                        poiEntity: state.poiList![index],
                      );
                    },
                    itemCount: state.poiList!.length,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
