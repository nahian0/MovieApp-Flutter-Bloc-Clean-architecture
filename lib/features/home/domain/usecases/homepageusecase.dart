import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';

abstract class HomepageUsecase {
  final HomePageRepositories homePageRepositories;
  HomepageUsecase(this.homePageRepositories);
}
