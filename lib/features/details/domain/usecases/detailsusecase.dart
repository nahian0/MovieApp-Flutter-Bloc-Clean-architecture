// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myapp/features/details/domain/repositories/details_repository.dart';

abstract class detailsusecase {
  final DetailspageRepository detailspageRepository;
  detailsusecase({
    required this.detailspageRepository,
  });
}
