import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/models/brand_model.dart';
import 'package:arwa_s_application1/presentation/home_page/widgets/rolexcomponent_item_widget.dart';
import 'package:arwa_s_application1/providers/brand_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandsScreen extends StatefulWidget {
  @override
  _BrandsScreenState createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final brandsAsyncValue = ref.watch(brandProvider);

        return brandsAsyncValue.when(
          data: (brands) {
            return _buildBrandComponent(context, brands);
          },
          loading: () {
            return CircularProgressIndicator();
          },
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
        );
      },
    );
  }

  Widget _buildBrandComponent(BuildContext context, List<Brand> brands) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 201.v,
          crossAxisCount: 2,
          mainAxisSpacing: 5.h,
          crossAxisSpacing: 9.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: RolexcomponentItemWidget(
              name: brands[index].name,
              picture: brands[index].logo,
            ),
          );
        },
      ),
    );
  }
}
