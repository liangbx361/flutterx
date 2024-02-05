class DataPageVm<T> {
  List<T> datas;
  String? nextPageToken;

  DataPageVm({
    required this.datas,
    this.nextPageToken,
  });
}
