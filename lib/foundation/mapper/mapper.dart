abstract class Mapper<FROM, TO> {
  TO map(FROM from);

  List<TO> mapList(List<FROM> from) => from.map(map).toList();
}
