import 'package:equatable/equatable.dart';

abstract class Either<L, R> extends Equatable {
  const Either();

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  L get left => (this as Left<L, R>).value;
  R get right => (this as Right<L, R>).value;

  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight);
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight) => ifLeft(value);

  @override
  List<Object?> get props => [value];
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  B fold<B>(B Function(L) ifLeft, B Function(R) ifRight) => ifRight(value);

  @override
  List<Object?> get props => [value];
}
