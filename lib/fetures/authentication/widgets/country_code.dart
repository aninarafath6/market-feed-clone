import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/widgets/inputbox.dart';
import 'package:marketfeed_clone/fetures/authentication/models/country_dropdown.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/country_code_view_model.dart';
import 'package:marketfeed_clone/fetures/onboarding/view_models/onboarding_view_model.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:marketfeed_clone/utils/navigation.dart';
import 'package:provider/src/provider.dart';

class CountryCodes extends StatelessWidget {
  const CountryCodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<CountryCodeViewModel>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          height: context.getHeight(95),
          width: context.getWidth(80),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              InputBox(
                inputLabel: 'search your country',
                type: TextInputType.text,
                onChanged: provider.filteredCountry,
              ),
              const SizedBox(height: 25),
              Expanded(
                child: FutureBuilder<List<CountryModel>>(
                  future: context.watch<CountryCodeViewModel>().result,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const SizedBox();
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            provider.updateCountryCode(snapshot.data![index]);
                            context.pop(true);
                          },
                          title: Text(
                            snapshot.data![index].name,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data![index].dialCode,
                            style: GoogleFonts.roboto(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
