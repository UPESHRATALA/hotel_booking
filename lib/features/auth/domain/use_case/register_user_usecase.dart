import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/entity/auth_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/auth_repository.dart';

import '../../../../app/usecase/usecase.dart';

class RegisterUserParams extends Equatable {
  final String fname;
  final String lname;
  final String phone;
  final String username;
  final String password;
  final String? image;

  const RegisterUserParams({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [fname, lname, phone, username, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      fName: params.fname,
      lName: params.lname,
      username: params.username,
      password: params.password,
      phone: params.phone,
      image: params.image,
    );
    return repository.registerCustomer(authEntity);
  }
}
